# Quick Start Guide - Running the Mobile App

## Prerequisites

Before running the app, make sure you have:

1. **Node.js** (>=18.0.0) - [Download](https://nodejs.org/)
2. **Expo CLI** (optional but recommended):
   ```bash
   npm install -g expo-cli
   ```
3. **Expo Go App** on your phone (for testing on physical device):
   - [iOS App Store](https://apps.apple.com/app/expo-go/id982107779)
   - [Google Play Store](https://play.google.com/store/apps/details?id=host.exp.exponent)

## Running the App

### Option 1: Start Development Server (Recommended)

1. Navigate to the mobile directory:
   ```bash
   cd mobile
   ```

2. Start the Expo development server:
   ```bash
   npm start
   ```
   or
   ```bash
   expo start
   ```

3. This will open Expo DevTools in your browser. You can then:
   - **Press `i`** - Open iOS Simulator (requires Xcode on Mac)
   - **Press `a`** - Open Android Emulator (requires Android Studio)
   - **Scan QR code** - Use Expo Go app on your phone to scan the QR code
   - **Press `w`** - Open in web browser (for testing)

### Option 2: Run on Specific Platform

#### iOS (Mac only)
```bash
npm run ios
```
or
```bash
expo start --ios
```

#### Android
```bash
npm run android
```
or
```bash
expo start --android
```

#### Web Browser
```bash
npm run web
```
or
```bash
expo start --web
```

## Testing on Physical Device

1. Install **Expo Go** app on your phone (iOS or Android)
2. Make sure your phone and computer are on the same Wi-Fi network
3. Run `npm start` in the mobile directory
4. Scan the QR code with:
   - **iOS**: Camera app (iOS 11+)
   - **Android**: Expo Go app

## Troubleshooting

### "Expo CLI not found"
Install Expo CLI globally:
```bash
npm install -g expo-cli
```

### "Cannot connect to Metro bundler"
- Make sure port 8081 is not in use
- Try clearing cache: `expo start -c`
- Check firewall settings

### "Module not found" errors
- Delete `node_modules` folder
- Run `npm install` again
- Clear cache: `expo start -c`

### API Connection Issues
- Verify API base URL in `src/lib/api.ts`
- Default URL: `https://hello-bahrain-e-commerce-client.vercel.app`
- Make sure the backend server is running and accessible

### iOS Simulator Issues (Mac)
- Make sure Xcode is installed
- Run: `xcode-select --install` if needed
- Open Xcode and accept license agreements

### Android Emulator Issues
- Make sure Android Studio is installed
- Create an Android Virtual Device (AVD) in Android Studio
- Make sure Android SDK is properly configured

## Development Tips

1. **Hot Reload**: Changes automatically reload in the app
2. **Shake Device/Simulator**: Opens developer menu
3. **Reload**: Press `r` in terminal to reload app
4. **Clear Cache**: Press `c` in terminal to clear cache

## Next Steps

1. Configure API base URL if different from default
2. Test all features (login, products, cart, checkout)
3. Customize app icons and splash screens
4. Build for production when ready

## Need Help?

- Expo Documentation: https://docs.expo.dev/
- React Native Docs: https://reactnative.dev/
- Check the main README.md for more details



