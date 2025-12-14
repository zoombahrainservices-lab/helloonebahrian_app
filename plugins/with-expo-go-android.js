const { withAndroidManifest } = require('@expo/config-plugins');

/**
 * Plugin to make Expo Go work with custom package name when pressing 'a'
 */
const withExpoGoAndroid = (config) => {
  return withAndroidManifest(config, async (config) => {
    const androidManifest = config.modResults;
    
    // Add intent filter to allow Expo Go to open the app
    const mainActivity = androidManifest.manifest.application[0].activity?.find(
      (activity) => activity.$['android:name'] === '.MainActivity'
    );
    
    if (mainActivity) {
      if (!mainActivity['intent-filter']) {
        mainActivity['intent-filter'] = [];
      }
      
      // Add Expo Go intent filter
      mainActivity['intent-filter'].push({
        action: [{ $: { 'android:name': 'android.intent.action.VIEW' } }],
        category: [
          { $: { 'android:name': 'android.intent.category.DEFAULT' } },
          { $: { 'android:name': 'android.intent.category.BROWSABLE' } },
        ],
        data: [{ $: { 'android:scheme': 'exp' } }],
      });
    }
    
    return config;
  });
};

module.exports = withExpoGoAndroid;





