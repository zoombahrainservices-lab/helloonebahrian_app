# 🔧 Fix "Cannot connect to Metro" Error

## What is This Error?

**Metro** is the JavaScript bundler for React Native/Expo. Your Android emulator can't connect to it, which means:
- ❌ The Metro bundler isn't running
- ❌ Or the emulator can't reach it

## ✅ Quick Fix

### Step 1: Start Metro Bundler

**In your terminal, run:**
```powershell
cd mobile
npx expo start --clear
```

**Or if using npm:**
```powershell
cd mobile
npm start -- --clear
```

### Step 2: Connect Your Emulator

Once Metro starts, you'll see a QR code and options:
- Press `a` to open in Android emulator
- Press `i` to open in iOS simulator
- Press `w` to open in web browser

### Step 3: If Still Not Working

**Try these solutions:**

1. **Restart Metro with tunnel:**
   ```powershell
   npx expo start --tunnel
   ```

2. **Check if Metro is already running:**
   - Close all terminal windows
   - Kill any existing Metro processes
   - Start fresh: `npx expo start --clear`

3. **Reset Metro cache:**
   ```powershell
   npx expo start --clear
   ```

4. **Check Android emulator connection:**
   ```powershell
   adb devices
   ```
   - Should show your emulator listed
   - If not, restart the emulator

5. **Restart Android emulator:**
   - Close the emulator
   - Open Android Studio → AVD Manager
   - Start the emulator again
   - Then run `npx expo start`

## 🎯 Common Causes

1. **Metro not running** - Most common
2. **Port already in use** - Another process using port 8081
3. **Network issue** - Firewall blocking connection
4. **Emulator not connected** - ADB not detecting emulator

## ✅ Solution Checklist

- [ ] Metro bundler is running (`npx expo start`)
- [ ] Android emulator is running
- [ ] Pressed `a` in Metro terminal to connect
- [ ] Cleared Metro cache (`--clear` flag)
- [ ] Checked `adb devices` shows emulator
- [ ] Restarted emulator if needed

## 🚀 Quick Command

**Run this to fix everything:**
```powershell
cd mobile
npx expo start --clear
```
Then press `a` when Metro starts!

---

## 💡 Why This Happens

- Metro bundler needs to be running for your app to work
- The emulator connects to Metro on `localhost:8081`
- If Metro isn't running, the emulator can't load your app

**This is normal during development!** Just start Metro and you're good to go! 🎉





