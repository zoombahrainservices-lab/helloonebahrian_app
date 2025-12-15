# 🤖 Complete Android Studio Installation Guide

## Step-by-Step Installation

### Step 1: Download Android Studio

1. **Open your browser**
2. **Go to:** https://developer.android.com/studio
3. **Click "Download Android Studio"**
4. **Wait for download** (file is ~1GB, takes 5-10 minutes)
5. **File will be:** `android-studio-*.exe`

### Step 2: Install Android Studio

1. **Run the installer** (android-studio-*.exe)
2. **Click "Next"** on welcome screen
3. **Choose components:**
   - ✅ Android Studio
   - ✅ Android SDK
   - ✅ Android Virtual Device
   - ✅ Performance (Intel HAXM) - if available
4. **Click "Next"**
5. **Choose installation location:**
   - Default: `C:\Program Files\Android\Android Studio`
   - Click "Next"
6. **Click "Install"**
7. **Wait for installation** (10-15 minutes)
8. **Click "Finish"**

### Step 3: First Launch Setup

1. **Android Studio opens automatically**
2. **Choose "Standard" installation**
3. **Click "Next"**
4. **Accept license agreements**
5. **Click "Finish"**
6. **Wait for SDK download** (5-10 minutes)
7. **Click "Finish"**

### Step 4: Set Environment Variables

#### Windows 10/11:

1. **Open System Properties:**
   - Press `Windows + X`
   - Click "System"
   - Click "About" (on the right)
   - Click "Advanced system settings"

2. **Add ANDROID_HOME:**
   - Click "Environment Variables" button
   - Under "System variables" section, click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click "OK"

3. **Add to PATH:**
   - In Environment Variables window, find "Path" in "System variables"
   - Click "Edit"
   - Click "New"
   - Add: `%ANDROID_HOME%\platform-tools`
   - Click "New" again
   - Add: `%ANDROID_HOME%\tools`
   - Click "OK" on all dialogs

4. **VERY IMPORTANT: Restart Computer**
   - Close all programs
   - Restart Windows
   - Environment variables only work after restart!

### Step 5: Create Android Virtual Device (AVD)

1. **Open Android Studio**
2. **Click "More Actions" → "Virtual Device Manager"**
   - Or: Tools → Device Manager
3. **Click "Create Device"** button
4. **Choose a device:**
   - Recommended: "Pixel 5" or "Pixel 6"
   - Click "Next"
5. **Choose System Image:**
   - Recommended: "Tiramisu" (API 33) or "UpsideDownCake" (API 34)
   - If not downloaded, click "Download" next to it
   - Wait for download (5-10 minutes)
   - Click "Next"
6. **Verify Configuration:**
   - Name: Pixel 5 API 33 (or similar)
   - Click "Finish"
7. **Your AVD is ready!**

### Step 6: Test Android Emulator

1. **Close all terminals**
2. **Open new PowerShell terminal**
3. **Navigate to project:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```
4. **Start Expo:**
   ```powershell
   npm start
   ```
5. **Press 'a' in terminal**
6. **Android emulator should open!**
7. **Wait for emulator to boot** (first time takes 2-3 minutes)
8. **App will load automatically!**

## ✅ Verification

### Check if Android SDK is installed:

```powershell
# Check ANDROID_HOME
echo $env:ANDROID_HOME

# Should show: C:\Users\Farzeen\AppData\Local\Android\Sdk
```

### Check if adb works:

```powershell
adb version
# Should show: Android Debug Bridge version 1.0.XX
```

### If commands don't work:
- Make sure you **restarted your computer** after setting environment variables
- Check if paths are correct in Environment Variables

## 🐛 Troubleshooting

### Error: "ANDROID_HOME not found"
- **Solution:** Make sure you restarted computer after setting environment variables
- **Check:** Open Environment Variables and verify `ANDROID_HOME` exists

### Error: "adb not recognized"
- **Solution:** Make sure `%ANDROID_HOME%\platform-tools` is in PATH
- **Check:** Restart terminal after adding to PATH

### Emulator is very slow
- **This is normal** - emulators are slower than real devices
- **Solution:** Use your phone with Expo Go instead (faster and better!)

### Emulator won't start
- **Check:** Make sure HAXM is installed (for Intel processors)
- **Check:** Enable virtualization in BIOS (if needed)
- **Alternative:** Use your phone instead

### Still not working?
- **Use your phone with Expo Go** - it's easier and faster!
- See `QUICK_START_PHONE.md` for phone setup

## 📊 Installation Summary

| Step | Time | Status |
|------|------|--------|
| Download Android Studio | 5-10 min | ⏳ |
| Install Android Studio | 10-15 min | ⏳ |
| First Launch Setup | 5-10 min | ⏳ |
| Set Environment Variables | 2 min | ⏳ |
| Create AVD | 5-10 min | ⏳ |
| **Total Time** | **30-50 min** | ⏳ |

## 💡 Pro Tip

**After installation, you can:**
- Press 'a' in terminal to open Android emulator
- Test your app on different Android versions
- Debug Android-specific issues

**But remember:** Your phone with Expo Go is still faster and better for testing!

## ✅ Next Steps

1. **Complete installation** (follow steps above)
2. **Restart computer** (important!)
3. **Test emulator** (press 'a' in terminal)
4. **Enjoy Android development!** 🎉








## Step-by-Step Installation

### Step 1: Download Android Studio

1. **Open your browser**
2. **Go to:** https://developer.android.com/studio
3. **Click "Download Android Studio"**
4. **Wait for download** (file is ~1GB, takes 5-10 minutes)
5. **File will be:** `android-studio-*.exe`

### Step 2: Install Android Studio

1. **Run the installer** (android-studio-*.exe)
2. **Click "Next"** on welcome screen
3. **Choose components:**
   - ✅ Android Studio
   - ✅ Android SDK
   - ✅ Android Virtual Device
   - ✅ Performance (Intel HAXM) - if available
4. **Click "Next"**
5. **Choose installation location:**
   - Default: `C:\Program Files\Android\Android Studio`
   - Click "Next"
6. **Click "Install"**
7. **Wait for installation** (10-15 minutes)
8. **Click "Finish"**

### Step 3: First Launch Setup

1. **Android Studio opens automatically**
2. **Choose "Standard" installation**
3. **Click "Next"**
4. **Accept license agreements**
5. **Click "Finish"**
6. **Wait for SDK download** (5-10 minutes)
7. **Click "Finish"**

### Step 4: Set Environment Variables

#### Windows 10/11:

1. **Open System Properties:**
   - Press `Windows + X`
   - Click "System"
   - Click "About" (on the right)
   - Click "Advanced system settings"

2. **Add ANDROID_HOME:**
   - Click "Environment Variables" button
   - Under "System variables" section, click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click "OK"

3. **Add to PATH:**
   - In Environment Variables window, find "Path" in "System variables"
   - Click "Edit"
   - Click "New"
   - Add: `%ANDROID_HOME%\platform-tools`
   - Click "New" again
   - Add: `%ANDROID_HOME%\tools`
   - Click "OK" on all dialogs

4. **VERY IMPORTANT: Restart Computer**
   - Close all programs
   - Restart Windows
   - Environment variables only work after restart!

### Step 5: Create Android Virtual Device (AVD)

1. **Open Android Studio**
2. **Click "More Actions" → "Virtual Device Manager"**
   - Or: Tools → Device Manager
3. **Click "Create Device"** button
4. **Choose a device:**
   - Recommended: "Pixel 5" or "Pixel 6"
   - Click "Next"
5. **Choose System Image:**
   - Recommended: "Tiramisu" (API 33) or "UpsideDownCake" (API 34)
   - If not downloaded, click "Download" next to it
   - Wait for download (5-10 minutes)
   - Click "Next"
6. **Verify Configuration:**
   - Name: Pixel 5 API 33 (or similar)
   - Click "Finish"
7. **Your AVD is ready!**

### Step 6: Test Android Emulator

1. **Close all terminals**
2. **Open new PowerShell terminal**
3. **Navigate to project:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```
4. **Start Expo:**
   ```powershell
   npm start
   ```
5. **Press 'a' in terminal**
6. **Android emulator should open!**
7. **Wait for emulator to boot** (first time takes 2-3 minutes)
8. **App will load automatically!**

## ✅ Verification

### Check if Android SDK is installed:

```powershell
# Check ANDROID_HOME
echo $env:ANDROID_HOME

# Should show: C:\Users\Farzeen\AppData\Local\Android\Sdk
```

### Check if adb works:

```powershell
adb version
# Should show: Android Debug Bridge version 1.0.XX
```

### If commands don't work:
- Make sure you **restarted your computer** after setting environment variables
- Check if paths are correct in Environment Variables

## 🐛 Troubleshooting

### Error: "ANDROID_HOME not found"
- **Solution:** Make sure you restarted computer after setting environment variables
- **Check:** Open Environment Variables and verify `ANDROID_HOME` exists

### Error: "adb not recognized"
- **Solution:** Make sure `%ANDROID_HOME%\platform-tools` is in PATH
- **Check:** Restart terminal after adding to PATH

### Emulator is very slow
- **This is normal** - emulators are slower than real devices
- **Solution:** Use your phone with Expo Go instead (faster and better!)

### Emulator won't start
- **Check:** Make sure HAXM is installed (for Intel processors)
- **Check:** Enable virtualization in BIOS (if needed)
- **Alternative:** Use your phone instead

### Still not working?
- **Use your phone with Expo Go** - it's easier and faster!
- See `QUICK_START_PHONE.md` for phone setup

## 📊 Installation Summary

| Step | Time | Status |
|------|------|--------|
| Download Android Studio | 5-10 min | ⏳ |
| Install Android Studio | 10-15 min | ⏳ |
| First Launch Setup | 5-10 min | ⏳ |
| Set Environment Variables | 2 min | ⏳ |
| Create AVD | 5-10 min | ⏳ |
| **Total Time** | **30-50 min** | ⏳ |

## 💡 Pro Tip

**After installation, you can:**
- Press 'a' in terminal to open Android emulator
- Test your app on different Android versions
- Debug Android-specific issues

**But remember:** Your phone with Expo Go is still faster and better for testing!

## ✅ Next Steps

1. **Complete installation** (follow steps above)
2. **Restart computer** (important!)
3. **Test emulator** (press 'a' in terminal)
4. **Enjoy Android development!** 🎉








## Step-by-Step Installation

### Step 1: Download Android Studio

1. **Open your browser**
2. **Go to:** https://developer.android.com/studio
3. **Click "Download Android Studio"**
4. **Wait for download** (file is ~1GB, takes 5-10 minutes)
5. **File will be:** `android-studio-*.exe`

### Step 2: Install Android Studio

1. **Run the installer** (android-studio-*.exe)
2. **Click "Next"** on welcome screen
3. **Choose components:**
   - ✅ Android Studio
   - ✅ Android SDK
   - ✅ Android Virtual Device
   - ✅ Performance (Intel HAXM) - if available
4. **Click "Next"**
5. **Choose installation location:**
   - Default: `C:\Program Files\Android\Android Studio`
   - Click "Next"
6. **Click "Install"**
7. **Wait for installation** (10-15 minutes)
8. **Click "Finish"**

### Step 3: First Launch Setup

1. **Android Studio opens automatically**
2. **Choose "Standard" installation**
3. **Click "Next"**
4. **Accept license agreements**
5. **Click "Finish"**
6. **Wait for SDK download** (5-10 minutes)
7. **Click "Finish"**

### Step 4: Set Environment Variables

#### Windows 10/11:

1. **Open System Properties:**
   - Press `Windows + X`
   - Click "System"
   - Click "About" (on the right)
   - Click "Advanced system settings"

2. **Add ANDROID_HOME:**
   - Click "Environment Variables" button
   - Under "System variables" section, click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click "OK"

3. **Add to PATH:**
   - In Environment Variables window, find "Path" in "System variables"
   - Click "Edit"
   - Click "New"
   - Add: `%ANDROID_HOME%\platform-tools`
   - Click "New" again
   - Add: `%ANDROID_HOME%\tools`
   - Click "OK" on all dialogs

4. **VERY IMPORTANT: Restart Computer**
   - Close all programs
   - Restart Windows
   - Environment variables only work after restart!

### Step 5: Create Android Virtual Device (AVD)

1. **Open Android Studio**
2. **Click "More Actions" → "Virtual Device Manager"**
   - Or: Tools → Device Manager
3. **Click "Create Device"** button
4. **Choose a device:**
   - Recommended: "Pixel 5" or "Pixel 6"
   - Click "Next"
5. **Choose System Image:**
   - Recommended: "Tiramisu" (API 33) or "UpsideDownCake" (API 34)
   - If not downloaded, click "Download" next to it
   - Wait for download (5-10 minutes)
   - Click "Next"
6. **Verify Configuration:**
   - Name: Pixel 5 API 33 (or similar)
   - Click "Finish"
7. **Your AVD is ready!**

### Step 6: Test Android Emulator

1. **Close all terminals**
2. **Open new PowerShell terminal**
3. **Navigate to project:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```
4. **Start Expo:**
   ```powershell
   npm start
   ```
5. **Press 'a' in terminal**
6. **Android emulator should open!**
7. **Wait for emulator to boot** (first time takes 2-3 minutes)
8. **App will load automatically!**

## ✅ Verification

### Check if Android SDK is installed:

```powershell
# Check ANDROID_HOME
echo $env:ANDROID_HOME

# Should show: C:\Users\Farzeen\AppData\Local\Android\Sdk
```

### Check if adb works:

```powershell
adb version
# Should show: Android Debug Bridge version 1.0.XX
```

### If commands don't work:
- Make sure you **restarted your computer** after setting environment variables
- Check if paths are correct in Environment Variables

## 🐛 Troubleshooting

### Error: "ANDROID_HOME not found"
- **Solution:** Make sure you restarted computer after setting environment variables
- **Check:** Open Environment Variables and verify `ANDROID_HOME` exists

### Error: "adb not recognized"
- **Solution:** Make sure `%ANDROID_HOME%\platform-tools` is in PATH
- **Check:** Restart terminal after adding to PATH

### Emulator is very slow
- **This is normal** - emulators are slower than real devices
- **Solution:** Use your phone with Expo Go instead (faster and better!)

### Emulator won't start
- **Check:** Make sure HAXM is installed (for Intel processors)
- **Check:** Enable virtualization in BIOS (if needed)
- **Alternative:** Use your phone instead

### Still not working?
- **Use your phone with Expo Go** - it's easier and faster!
- See `QUICK_START_PHONE.md` for phone setup

## 📊 Installation Summary

| Step | Time | Status |
|------|------|--------|
| Download Android Studio | 5-10 min | ⏳ |
| Install Android Studio | 10-15 min | ⏳ |
| First Launch Setup | 5-10 min | ⏳ |
| Set Environment Variables | 2 min | ⏳ |
| Create AVD | 5-10 min | ⏳ |
| **Total Time** | **30-50 min** | ⏳ |

## 💡 Pro Tip

**After installation, you can:**
- Press 'a' in terminal to open Android emulator
- Test your app on different Android versions
- Debug Android-specific issues

**But remember:** Your phone with Expo Go is still faster and better for testing!

## ✅ Next Steps

1. **Complete installation** (follow steps above)
2. **Restart computer** (important!)
3. **Test emulator** (press 'a' in terminal)
4. **Enjoy Android development!** 🎉








## Step-by-Step Installation

### Step 1: Download Android Studio

1. **Open your browser**
2. **Go to:** https://developer.android.com/studio
3. **Click "Download Android Studio"**
4. **Wait for download** (file is ~1GB, takes 5-10 minutes)
5. **File will be:** `android-studio-*.exe`

### Step 2: Install Android Studio

1. **Run the installer** (android-studio-*.exe)
2. **Click "Next"** on welcome screen
3. **Choose components:**
   - ✅ Android Studio
   - ✅ Android SDK
   - ✅ Android Virtual Device
   - ✅ Performance (Intel HAXM) - if available
4. **Click "Next"**
5. **Choose installation location:**
   - Default: `C:\Program Files\Android\Android Studio`
   - Click "Next"
6. **Click "Install"**
7. **Wait for installation** (10-15 minutes)
8. **Click "Finish"**

### Step 3: First Launch Setup

1. **Android Studio opens automatically**
2. **Choose "Standard" installation**
3. **Click "Next"**
4. **Accept license agreements**
5. **Click "Finish"**
6. **Wait for SDK download** (5-10 minutes)
7. **Click "Finish"**

### Step 4: Set Environment Variables

#### Windows 10/11:

1. **Open System Properties:**
   - Press `Windows + X`
   - Click "System"
   - Click "About" (on the right)
   - Click "Advanced system settings"

2. **Add ANDROID_HOME:**
   - Click "Environment Variables" button
   - Under "System variables" section, click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click "OK"

3. **Add to PATH:**
   - In Environment Variables window, find "Path" in "System variables"
   - Click "Edit"
   - Click "New"
   - Add: `%ANDROID_HOME%\platform-tools`
   - Click "New" again
   - Add: `%ANDROID_HOME%\tools`
   - Click "OK" on all dialogs

4. **VERY IMPORTANT: Restart Computer**
   - Close all programs
   - Restart Windows
   - Environment variables only work after restart!

### Step 5: Create Android Virtual Device (AVD)

1. **Open Android Studio**
2. **Click "More Actions" → "Virtual Device Manager"**
   - Or: Tools → Device Manager
3. **Click "Create Device"** button
4. **Choose a device:**
   - Recommended: "Pixel 5" or "Pixel 6"
   - Click "Next"
5. **Choose System Image:**
   - Recommended: "Tiramisu" (API 33) or "UpsideDownCake" (API 34)
   - If not downloaded, click "Download" next to it
   - Wait for download (5-10 minutes)
   - Click "Next"
6. **Verify Configuration:**
   - Name: Pixel 5 API 33 (or similar)
   - Click "Finish"
7. **Your AVD is ready!**

### Step 6: Test Android Emulator

1. **Close all terminals**
2. **Open new PowerShell terminal**
3. **Navigate to project:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```
4. **Start Expo:**
   ```powershell
   npm start
   ```
5. **Press 'a' in terminal**
6. **Android emulator should open!**
7. **Wait for emulator to boot** (first time takes 2-3 minutes)
8. **App will load automatically!**

## ✅ Verification

### Check if Android SDK is installed:

```powershell
# Check ANDROID_HOME
echo $env:ANDROID_HOME

# Should show: C:\Users\Farzeen\AppData\Local\Android\Sdk
```

### Check if adb works:

```powershell
adb version
# Should show: Android Debug Bridge version 1.0.XX
```

### If commands don't work:
- Make sure you **restarted your computer** after setting environment variables
- Check if paths are correct in Environment Variables

## 🐛 Troubleshooting

### Error: "ANDROID_HOME not found"
- **Solution:** Make sure you restarted computer after setting environment variables
- **Check:** Open Environment Variables and verify `ANDROID_HOME` exists

### Error: "adb not recognized"
- **Solution:** Make sure `%ANDROID_HOME%\platform-tools` is in PATH
- **Check:** Restart terminal after adding to PATH

### Emulator is very slow
- **This is normal** - emulators are slower than real devices
- **Solution:** Use your phone with Expo Go instead (faster and better!)

### Emulator won't start
- **Check:** Make sure HAXM is installed (for Intel processors)
- **Check:** Enable virtualization in BIOS (if needed)
- **Alternative:** Use your phone instead

### Still not working?
- **Use your phone with Expo Go** - it's easier and faster!
- See `QUICK_START_PHONE.md` for phone setup

## 📊 Installation Summary

| Step | Time | Status |
|------|------|--------|
| Download Android Studio | 5-10 min | ⏳ |
| Install Android Studio | 10-15 min | ⏳ |
| First Launch Setup | 5-10 min | ⏳ |
| Set Environment Variables | 2 min | ⏳ |
| Create AVD | 5-10 min | ⏳ |
| **Total Time** | **30-50 min** | ⏳ |

## 💡 Pro Tip

**After installation, you can:**
- Press 'a' in terminal to open Android emulator
- Test your app on different Android versions
- Debug Android-specific issues

**But remember:** Your phone with Expo Go is still faster and better for testing!

## ✅ Next Steps

1. **Complete installation** (follow steps above)
2. **Restart computer** (important!)
3. **Test emulator** (press 'a' in terminal)
4. **Enjoy Android development!** 🎉









