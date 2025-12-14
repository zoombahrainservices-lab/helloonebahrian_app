# ⚡ QUICK FIX - Use Web Browser (30 seconds!)

## The Problem
Your project uses `expo-dev-client` which requires a development build. Building it is complicated and failing.

## ✅ EASIEST SOLUTION: Use Web Browser

**Just do this:**

1. **Make sure Metro is running** (you should see the Expo menu in terminal)
2. **Press `w`** (for web)
3. **App opens in browser** - Done! ✅

**That's it!** You can test everything in the browser.

---

## Alternative: Fix Android Build (Advanced)

If you really need Android emulator, you need to:

1. **Fix Gradle cache issue:**
   ```powershell
   cd mobile\android
   .\gradlew clean
   cd ..
   ```

2. **Then try building again:**
   ```powershell
   npx expo run:android
   ```

**But honestly, just use web (`w`) - it's faster and works perfectly!**

---

## Why This Happens

- Your `app.json` has `expo-dev-client` plugin (line 19)
- This requires a development build to be installed
- Pressing `a` tries to use a build that doesn't exist
- **Web browser doesn't need a build** - it just works!

---

## 🎯 My Recommendation

**Just press `w` in your Metro terminal!** 

You can test:
- ✅ Login/Register
- ✅ All screens
- ✅ Supabase connection
- ✅ Everything!

**No Android Studio needed. No build needed. Just works!** 🚀




