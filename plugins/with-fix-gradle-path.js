const { withAppBuildGradle } = require('@expo/config-plugins');

/**
 * Fixes the Expo SDK 51 bug where an empty path is generated in build.gradle at line 33
 * This plugin patches the build.gradle file to ensure no empty paths exist
 */
module.exports = function withFixGradlePath(config) {
  return withAppBuildGradle(config, (config) => {
    if (config.modResults.language === 'groovy') {
      let contents = config.modResults.contents;
      
      // Split into lines to fix line 33 specifically
      const lines = contents.split('\n');
      
      // Fix line 33 and surrounding lines (0-indexed, so line 33 is index 32)
      const fixedLines = lines.map((line, index) => {
        // Target the problematic line 33 area (lines 30-35, 0-indexed)
        if (index >= 29 && index <= 34) {
          // Check for empty string assignments that could be paths
          // Pattern: variable = '' or variable = ""
          const emptyStringPattern = /(\w+)\s*=\s*['"]\s*['"]/;
          if (emptyStringPattern.test(line)) {
            // Replace empty string with a valid file path
            return line.replace(emptyStringPattern, '$1 = file(".")');
          }
          
          // Also check for: path('') or path("")
          const emptyPathPattern = /path\s*\(\s*['"]\s*['"]\s*\)/;
          if (emptyPathPattern.test(line)) {
            return line.replace(emptyPathPattern, 'file(".")');
          }
        }
        return line;
      });
      
      contents = fixedLines.join('\n');
      
      // Additional fix: replace any remaining empty path patterns globally
      contents = contents.replace(
        /(\w+)\s*=\s*['"]\s*['"]/g,
        (match, varName) => {
          // If it looks like a path-related variable, fix it
          const lowerVar = varName.toLowerCase();
          if (lowerVar.includes('path') || 
              lowerVar.includes('dir') ||
              lowerVar.includes('file') ||
              lowerVar.includes('resource')) {
            return `${varName} = file(".")`;
          }
          return match;
        }
      );
      
      config.modResults.contents = contents;
    }
    return config;
  });
};

