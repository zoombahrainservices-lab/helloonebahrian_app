# Fix: Running App in Android Studio Emulator

## The Problem

When you press `a` in Expo, you get:
```
CommandError: No development build (com.hellobahrain.mobile) for this project is installed.
```

**Why this happens:**
- Your app has a custom package name: `com.hellobahrain.mobile`
- Expo is looking for a development build with that package name
- No development build is installed on the Android emulator

## ✅ Solution: Use Expo Go in Android Emulator

This is the **easiest and fastest** way to run your app in Android Studio!

### Step 1: Start Android Emulator

1. Open **Android Studio**
2. Go to **Tools → Device Manager**
3. Click **▶️ Start** on an emulator (or create one if needed)
4. Wait for emulator to fully boot

### Step 2: Install Expo Go in Emulator

1. In the Android emulator, open **Play Store**
2. Search for **"Expo Go"**
3. Install **Expo Go** app (by Expo)
4. Wait for installation to complete

### Step 3: Start Your Expo App

```powershell
cd mobile
npm start
```

**IMPORTANT:** When the QR code appears:
- **DON'T press `a`** (that causes the error)
- **Instead:** Look at the terminal for the URL (usually `exp://192.168.x.x:8081`)

### Step 4: Connect from Emulator

**Option A: Enter URL Manually (Easiest)**
1. Open **Expo Go** app in the emulator
2. Tap **"Enter URL manually"**
3. Type the URL from terminal (e.g., `exp://192.168.1.100:8081`)
4. Tap **"Connect"**
5. App will load! 🎉

**Option B: Use QR Code (If emulator supports camera)**
1. In Expo Go, tap **"Scan QR code"**
2. Some emulators support camera - try it
3. If not, use Option A

### Step 5: Verify Connection

- You should see your app loading in Expo Go
- The terminal will show "Connected" messages
- Your app should appear in the emulator!

## Alternative: Build Development Build (Advanced)

If you really need a development build (not recommended for quick testing):

### Step 1: Install expo-dev-client

```powershell
cd mobile
npm install expo-dev-client
```

### Step 2: Build Development Build

```powershell
npx eas build --profile development --platform android
```

This will:
- Take 10-20 minutes
- Build a custom APK
- Upload it to EAS servers

### Step 3: Install on Emulator

1. Download the APK from EAS
2. Drag and drop into emulator
3. Install the APK
4. Then press `a` in Expo

**Note:** This is much slower than using Expo Go!

## Quick Reference

### ✅ Recommended Method (Expo Go)
```powershell
# 1. Start emulator in Android Studio
# 2. Install Expo Go in emulator
# 3. Run:
cd mobile
npm start
# 4. In Expo Go, enter URL manually
```

### ❌ What NOT to Do
- Don't press `a` when you see the QR code
- Don't try to build development build unless necessary
- Don't expect it to work without Expo Go installed

## Troubleshooting

### "Can't connect to Expo"
- Make sure emulator and computer are on same network
- Check firewall isn't blocking port 8081
- Try using tunnel mode: `npm start --tunnel`

### "Expo Go not found in Play Store"
- Make sure emulator has Google Play Services
- Try downloading APK directly: https://expo.dev/tools

### "App crashes in Expo Go"
- Check terminal for error messages
- Make sure all dependencies are installed: `npm install`
- Try clearing cache: `npm start --clear`

## Summary

✅ **Best Method:** Install Expo Go in Android emulator, then connect manually  
✅ **Fastest:** Takes 2 minutes to set up  
✅ **Works immediately:** No building required  
❌ **Don't press `a`:** That tries to use development build which doesn't exist  

**Your app will work perfectly in Android Studio emulator with Expo Go!**





