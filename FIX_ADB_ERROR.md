# ✅ Fix: "adb is not recognized" Error

## The Problem

When you run commands, you get:
```
adb : The term 'adb' is not recognized
```

This means Android Studio's ADB (Android Debug Bridge) is not in your system PATH.

## 🚀 Quick Fix (2 Minutes)

### Step 1: Run the Fix Script as Administrator

**Right-click PowerShell → Run as Administrator**, then:

```powershell
cd mobile
powershell -ExecutionPolicy Bypass -File ./fix-adb-setup.ps1
```

This script will:
- ✅ Find your Android SDK
- ✅ Set ANDROID_HOME environment variable
- ✅ Add ADB to PATH
- ✅ Configure everything automatically

### Step 2: Restart Your Terminal

**IMPORTANT:** Close ALL terminal windows and open a new one.

### Step 3: Verify It Works

```powershell
adb version
```

Should show: `Android Debug Bridge version 1.0.xx`

If it still says "not recognized", restart your **computer** (not just terminal).

---

## 🔧 Manual Fix (If Script Doesn't Work)

### Step 1: Find Android SDK Location

Common locations:
- `C:\Users\Farzeen\AppData\Local\Android\Sdk`
- `C:\Android\Sdk`

### Step 2: Set Environment Variables

1. Press `Win + X` → **System**
2. Click **Advanced system settings**
3. Click **Environment Variables**
4. Under **System variables**, click **New**:
   - **Variable name:** `ANDROID_HOME`
   - **Variable value:** `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click **OK**

5. Find **Path** in System variables, click **Edit**
6. Click **New**, add: `%ANDROID_HOME%\platform-tools`
7. Click **OK** on all dialogs

### Step 3: Restart Computer

**You MUST restart your computer** for changes to take effect.

### Step 4: Verify

Open new terminal:
```powershell
adb version
```

Should show ADB version (not an error).

---

## 🔍 If Android SDK Not Found

If the script says "Android SDK not found":

1. **Install Android Studio:**
   - Download: https://developer.android.com/studio
   - Install with default settings

2. **Open Android Studio:**
   - Go to **Tools → SDK Manager**
   - Install **Android SDK Platform-Tools**
   - Note the SDK location (usually shown at top)

3. **Run the fix script again**

---

## ✅ After ADB Works

Once `adb version` works, you can:

1. **Build development build:**
   ```powershell
   cd mobile
   npm run android:build
   ```

2. **Then pressing 'a' will work!**

---

## Quick Commands

```powershell
# Fix ADB (as Administrator)
powershell -ExecutionPolicy Bypass -File ./fix-adb-setup.ps1

# Restart terminal, then verify
adb version

# Build development build
npm run android:build

# Press 'a' - works!
```

## Summary

✅ **Run fix script as Administrator**  
✅ **Restart terminal/computer**  
✅ **Verify with `adb version`**  
✅ **Build development build**  
✅ **Pressing 'a' works!**  

**Follow these steps and ADB will work!** 🎉





