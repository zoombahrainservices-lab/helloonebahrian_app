# ✅ Fix ADB "Not Recognized" Error - Step by Step

## The Problem
```
adb : The term 'adb' is not recognized
```

This means ADB is not in your system PATH.

## 🚀 Fix It Now (3 Steps)

### Step 1: Open PowerShell as Administrator

**IMPORTANT:** You MUST run as Administrator!

1. Press `Win + X`
2. Click **"Windows PowerShell (Admin)"** or **"Terminal (Admin)"**
3. If it asks for permission, click **Yes**

### Step 2: Run This Command

In the Administrator PowerShell window, run:

```powershell
cd "C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile"
powershell -ExecutionPolicy Bypass -File ./fix-adb-now.ps1
```

This will:
- ✅ Set ANDROID_HOME environment variable
- ✅ Add ADB to PATH
- ✅ Configure everything

### Step 3: Restart Your Terminal

**CRITICAL:** After running the script:

1. **Close ALL terminal/PowerShell windows**
2. **Open a NEW terminal**
3. **Test it:**

```powershell
adb version
```

Should show: `Android Debug Bridge version 1.0.xx`

If it still doesn't work, **restart your computer**.

---

## 🔧 Manual Setup (If Script Doesn't Work)

### Step 1: Open Environment Variables

1. Press `Win + X` → **System**
2. Click **Advanced system settings** (on the right)
3. Click **Environment Variables** button

### Step 2: Add ANDROID_HOME

1. Under **System variables**, click **New**
2. **Variable name:** `ANDROID_HOME`
3. **Variable value:** `C:\Users\Farzeen\AppData\Local\Android\Sdk`
4. Click **OK**

### Step 3: Add to PATH

1. Find **Path** in System variables list
2. Click **Edit**
3. Click **New**
4. Type: `%ANDROID_HOME%\platform-tools`
5. Click **OK** on all dialogs

### Step 4: Restart Computer

**You MUST restart your computer** for changes to take effect.

### Step 5: Verify

Open new terminal:
```powershell
adb version
```

Should work now!

---

## ✅ After ADB Works

Once `adb version` works:

1. **Start Android emulator** in Android Studio
2. **Build development build:**
   ```powershell
   cd mobile
   npm run android:build
   ```
3. **Press 'a' - works forever!**

---

## Quick Checklist

- [ ] Opened PowerShell as Administrator
- [ ] Ran fix script
- [ ] Restarted terminal
- [ ] Tested `adb version`
- [ ] If still not working, restarted computer

---

## Summary

✅ **Run script as Administrator**  
✅ **Restart terminal/computer**  
✅ **Verify with `adb version`**  
✅ **Then build development build**  
✅ **Pressing 'a' works!**  

**Follow these steps and ADB will work!** 🎉





