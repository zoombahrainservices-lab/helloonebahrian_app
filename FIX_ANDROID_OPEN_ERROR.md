# Fix: "No development build" Error on Android

## Problem
When you press `a` to open on Android, you get:
```
CommandError: No development build (com.hellobahrain.mobile) for this project is installed.
```

## Solution: Use Expo Go Instead

### Option 1: Use Expo Go on Your Phone (RECOMMENDED)

1. **Start Expo without Android flag:**
   ```powershell
   cd mobile
   npm start
   ```

2. **When the QR code appears:**
   - **DON'T press `a`** (that tries to use development build)
   - **Instead:** Scan the QR code with Expo Go app on your phone

3. **Install Expo Go if you don't have it:**
   - **Android:** https://play.google.com/store/apps/details?id=host.exp.exponent
   - **iOS:** https://apps.apple.com/app/expo-go/id982107779

4. **Scan the QR code:**
   - Open Expo Go app
   - Tap "Scan QR code"
   - Point camera at the QR code in terminal
   - App will load!

### Option 2: Use Tunnel Mode

If you're on a different network:

```powershell
cd mobile
npx expo start --tunnel
```

Then scan the QR code with Expo Go.

### Option 3: Use Web Browser

For quick testing:

```powershell
cd mobile
npx expo start --web
```

This opens in your browser at `http://localhost:8081`

### Option 4: Use Android Emulator with Expo Go

If you want to use the emulator:

1. Start Android emulator
2. Install Expo Go in the emulator (from Play Store)
3. Run: `npm start`
4. In Expo Go (inside emulator), scan the QR code or enter the URL manually

## Why This Happens

- Your app has a custom package name: `com.hellobahrain.mobile`
- Expo is looking for a development build with that package name
- Development builds need to be built and installed separately
- **Expo Go** works without building - it's faster for development!

## Quick Fix Commands

### For Phone (Expo Go):
```powershell
cd mobile
npm start
# Then scan QR code with Expo Go app
```

### For Web:
```powershell
cd mobile
npm start --web
```

### For Tunnel (if on different network):
```powershell
cd mobile
npx expo start --tunnel
# Then scan QR code
```

## Summary

✅ **Use Expo Go** - Scan QR code instead of pressing `a`  
✅ **Works on phone** - Install Expo Go and scan QR code  
✅ **Works on web** - Use `--web` flag  
✅ **Works on emulator** - Install Expo Go in emulator first  

**The error happens because you're trying to use a development build that doesn't exist. Expo Go is the solution!**





