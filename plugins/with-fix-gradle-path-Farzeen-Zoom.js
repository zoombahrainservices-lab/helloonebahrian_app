const { withAppBuildGradle } = require('expo/config-plugins');

/**
 * Fixes the Expo SDK 51 bug where an empty path is generated in build.gradle at line 33
 * This plugin patches the build.gradle file to fix:
 * 1. Empty file paths in signing config (storeFile, etc.)
 * 2. Empty paths in file() calls
 * 3. Empty paths in apply from: statements
 * 4. Any other empty path variables
 */
module.exports = function withFixGradlePath(config) {
  return withAppBuildGradle(config, (config) => {
    if (config.modResults.language === 'groovy') {
      let contents = config.modResults.contents;
      
      // Fix 1: Signing config with empty storeFile
      // Pattern: storeFile file('') or storeFile file("")
      contents = contents.replace(
        /storeFile\s+file\s*\(\s*['"]\s*['"]\s*\)/gi,
        '// storeFile removed - empty path detected'
      );
      
      // Fix 2: Any file() call with empty string - MUST BE FIRST to catch all
      // Pattern: file('') or file("") - but NOT storeFile (handled separately)
      // Use negative lookbehind to avoid matching storeFile
      contents = contents.replace(
        /(?<!storeFile\s+)file\s*\(\s*['"]\s*['"]\s*\)/gi,
        'file(".")'
      );
      
      // Also catch any standalone file('') that might have been missed
      contents = contents.replace(
        /\bfile\s*\(\s*['"]\s*['"]\s*\)/g,
        'file(".")'
      );
      
      // Fix 3: Any new File() call with empty string
      // Pattern: new File('') or new File("")
      contents = contents.replace(
        /new\s+File\s*\(\s*['"]\s*['"]\s*\)/gi,
        'new File(".")'
      );
      
      // Fix 4: Any project.file() call with empty string
      // Pattern: project.file('') or project.file("")
      contents = contents.replace(
        /project\.file\s*\(\s*['"]\s*['"]\s*\)/gi,
        'project.file(".")'
      );
      
      // Fix 5: apply from: with empty path
      // Pattern: apply from: '' or apply from: ""
      contents = contents.replace(
        /apply\s+from:\s*['"]\s*['"]/gi,
        '// apply from: removed - empty path detected'
      );
      
      // Fix 6: Line 33 specific fix - most important
      // Target the exact line where the error occurs
      const lines = contents.split('\n');
      const fixedLines = lines.map((line, index) => {
        // Target line 33 specifically (0-indexed: line 33 = index 32)
        // Check a wider range to catch the issue
        if (index >= 25 && index <= 40) {
          // Check for ANY assignment with empty string on this line
          if (line.match(/=\s*['"]\s*['"]/)) {
            // Replace empty string assignment with null
            line = line.replace(/=\s*['"]\s*['"]/, '= null // Fixed: was empty string');
          }
          
          // Check for file() calls with empty string
          if (line.match(/file\s*\(\s*['"]\s*['"]\s*\)/)) {
            line = line.replace(/file\s*\(\s*['"]\s*['"]\s*\)/, 'file(".")');
          }
          
          // Check for variable used in file() that might be empty
          const varInFileMatch = line.match(/file\s*\(\s*(\w+)\s*\)/);
          if (varInFileMatch) {
            const varName = varInFileMatch[1];
            // Check if this variable was set to empty string earlier
            // We'll add a guard
            const prevLines = lines.slice(Math.max(0, index - 10), index);
            const hasEmptyVar = prevLines.some(prevLine => 
              prevLine.match(new RegExp(`\\b${varName}\\s*=\\s*['"]\\s*['"]`))
            );
            if (hasEmptyVar) {
              // Wrap in conditional
              line = line.replace(
                /file\s*\(\s*(\w+)\s*\)/,
                `($1 != null && $1.toString().trim()) ? file($1) : file(".")`
              );
            }
          }
        }
        return line;
      });
      
      contents = fixedLines.join('\n');
      
      // Fix 7: Signing configs - make them safe
      // Find signingConfigs block and make storeFile conditional
      const signingConfigRegex = /(signingConfigs\s*\{[^}]*release\s*\{[^}]*storeFile\s+file\s*\([^)]+\))/s;
      if (signingConfigRegex.test(contents)) {
        // Replace signing config to make it safe
        contents = contents.replace(
          /(signingConfigs\s*\{[^}]*release\s*\{[^}]*?)(storeFile\s+file\s*\([^)]+\))/s,
          (match, before, storeFileLine) => {
            // Check if storeFile has empty path
            if (storeFileLine.match(/file\s*\(\s*['"]\s*['"]\s*\)/)) {
              // Remove the entire signing config block or comment it out
              return before + '// storeFile removed - empty path\n      // ' + storeFileLine;
            }
            return match;
          }
        );
      }
      
      // Fix 8: Build types release signingConfig - make it conditional
      contents = contents.replace(
        /(buildTypes\s*\{[^}]*release\s*\{[^}]*?)(signingConfig\s+signingConfigs\.release)/s,
        (match, before, signingConfigLine) => {
          // Only add signingConfig if it's not already guarded
          if (!before.includes('if') && !before.includes('signingConfig')) {
            return before + '// signingConfig removed - no valid keystore\n      // ' + signingConfigLine;
          }
          return match;
        }
      );
      
      // Fix 9: Global fix for any remaining empty path patterns
      // Pattern: path = '' or path = ""
      contents = contents.replace(
        /\bpath\s*=\s*['"]\s*['"]/gi,
        'path = null // Fixed: was empty string'
      );
      
      // Fix 10: Any variable ending with Path, File, Dir with empty string
      contents = contents.replace(
        /(\w*(?:Path|File|Dir|Store|Keystore))\s*=\s*['"]\s*['"]/gi,
        '$1 = null // Fixed: was empty string'
      );
      
      config.modResults.contents = contents;
    }
    return config;
  });
};
