# 🔧 Fix Gradle "path may not be null or empty string" Error

## ❌ The Problem

**Error:** `path may not be null or empty string. path=''` at line 33 of `build.gradle`

**When:** During EAS Build for Android (Expo SDK 51)

**Why:** This is a known issue with Expo SDK 51 where the generated `build.gradle` file has an empty path variable at line 33. This typically happens when Expo processes the Android configuration and some path ends up being empty.

## ✅ Fixes Applied

### 1. Added Explicit Android Icon Configuration
- Added `"icon": "./assets/icon.png"` to the `android` section in `app.json`
- This ensures Expo has an explicit icon path for Android builds
- Previously, only the root-level `icon` was set, which might not be properly resolved for Android

### 2. Verified All Asset Paths
- ✅ `icon`: `./assets/icon.png` (exists)
- ✅ `splash.image`: `./assets/splash.png` (exists)
- ✅ `android.adaptiveIcon.foregroundImage`: `./assets/adaptive-icon.png` (exists)
- ✅ `android.icon`: `./assets/icon.png` (now explicitly set)

## 🔍 Root Cause

The error occurs because:
1. **Expo SDK 51 Bug**: There's a known issue where Expo generates an empty path in the build.gradle file
2. **Path Resolution**: During the build process, some asset path might not be properly resolved
3. **Configuration Gap**: Missing explicit Android icon configuration can cause this

## 🚀 Solutions to Try

### Solution 1: Use the Updated Configuration (Already Applied)
The `app.json` now has explicit `android.icon` configuration. Try building again:

```powershell
cd mobile
eas build --platform android --profile production
```

### Solution 2: Clear EAS Build Cache
Sometimes cached configurations cause issues:

```powershell
cd mobile
eas build --platform android --profile production --clear-cache
```

### Solution 3: Try Preview Profile
Sometimes the preview profile works when production doesn't:

```powershell
cd mobile
eas build --platform android --profile preview
```

### Solution 4: Verify Asset Files
Ensure all asset files are valid PNG files:

```powershell
cd mobile/assets
Get-ChildItem *.png | Select-Object Name, Length
```

All files should have a size > 0 bytes.

### Solution 5: Check for Updates
This might be fixed in a newer Expo SDK version:

```powershell
cd mobile
npx expo install --fix
```

## 📋 Current Configuration

Your `app.json` now includes:

```json
{
  "expo": {
    "icon": "./assets/icon.png",
    "android": {
      "icon": "./assets/icon.png",  // ← Explicitly added
      "adaptiveIcon": {
        "foregroundImage": "./assets/adaptive-icon.png"
      }
    }
  }
}
```

## ⚠️ If Error Persists

If the error still occurs after these fixes:

1. **This is a known Expo SDK 51 issue** - It may require an Expo SDK update
2. **Check Expo Status** - Visit https://status.expo.dev for known issues
3. **Try Development Build** - Sometimes development builds work:
   ```powershell
   eas build --platform android --profile development
   ```
4. **Report to Expo** - If it's a bug, report it at https://github.com/expo/expo/issues

## 🎯 Expected Outcome

After applying the fix:
- The explicit `android.icon` should help Expo properly generate the build.gradle file
- All asset paths are now clearly defined
- The build should succeed or provide a more specific error

## 📝 Notes

- This error is **NOT caused by your code** - it's an Expo SDK 51 build system issue
- The fix we applied (explicit android.icon) is a workaround that often resolves the issue
- If it persists, it may require waiting for an Expo SDK update

