export default {
  expo: {
    name: 'HelloOne Bahrain',
    slug: 'helloonebh',
    version: '1.0.0',
    assetBundlePatterns: ['assets/**/*'],
    updates: {
      enabled: false,
      fallbackToCacheTimeout: 0,
    },
    runtimeVersion: {
      policy: 'sdkVersion',
    },
    extra: {
      supabaseUrl: 'https://clmhzxiuzqvebzlkbdjs.supabase.co',
      supabaseAnonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNsbWh6eGl1enF2ZWJ6bGtiZGpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ0Nzg0MjIsImV4cCI6MjA4MDA1NDQyMn0.pSUjWc4Ryu7xJ94n7DFAngGYMzT6gFi8K77OUVYeb3Y',
      eas: {
        projectId: '59c4cd2e-f293-4d0c-bf8c-6d21e7be5052',
      },
    },
    sdkVersion: '51.0.0',
    platforms: ['ios', 'android', 'web'],
  },
};


