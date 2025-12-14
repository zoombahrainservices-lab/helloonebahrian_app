# 🤖 Android Studio Setup - Step by Step

## ✅ You Downloaded Android Studio - Great!

Now let's set it up properly so you can test on Android emulator.

## 📋 Step 1: Install Android Studio

1. **Run the installer** you downloaded
2. **Choose "Standard" installation**
3. **Wait for installation** (10-15 minutes)
4. **Click "Finish"**

## 🔧 Step 2: First Launch Setup

1. **Android Studio opens automatically**
2. **Choose "Standard" installation** (if asked again)
3. **Accept license agreements**
4. **Click "Finish"**
5. **Wait for SDK download** (5-10 minutes)
6. **Click "Finish"**

## 🌍 Step 3: Set Environment Variables (IMPORTANT!)

### Windows 10/11:

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

## 📱 Step 4: Create Android Virtual Device (AVD)

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

## ✅ Step 5: Test Android Emulator

1. **Close all terminals**
2. **Open new PowerShell terminal**
3. **Navigate to project:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```
4. **Start Expo:**
   ```powershell
   npm start -- --clear
   ```
5. **Press 'a' in terminal**
6. **Android emulator should open!**
7. **Wait for emulator to boot** (first time takes 2-3 minutes)
8. **App will load automatically!**

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

## 📊 Quick Checklist

- [ ] Android Studio installed
- [ ] First launch completed
- [ ] ANDROID_HOME environment variable set
- [ ] PATH updated with platform-tools
- [ ] Computer restarted
- [ ] Android Virtual Device (AVD) created
- [ ] Tested with `npm start` and pressed 'a'

## 💡 Pro Tip

**After setup, you can:**
- Press 'a' in terminal to open Android emulator
- Test your app on different Android versions
- Debug Android-specific issues

**But remember:** Your phone with Expo Go is still faster and better for testing!

## ✅ Next Steps

1. **Complete installation** (follow steps above)
2. **Restart computer** (important!)
3. **Test emulator** (press 'a' in terminal)
4. **Enjoy Android development!** 🎉








## ✅ You Downloaded Android Studio - Great!

Now let's set it up properly so you can test on Android emulator.

## 📋 Step 1: Install Android Studio

1. **Run the installer** you downloaded
2. **Choose "Standard" installation**
3. **Wait for installation** (10-15 minutes)
4. **Click "Finish"**

## 🔧 Step 2: First Launch Setup

1. **Android Studio opens automatically**
2. **Choose "Standard" installation** (if asked again)
3. **Accept license agreements**
4. **Click "Finish"**
5. **Wait for SDK download** (5-10 minutes)
6. **Click "Finish"**

## 🌍 Step 3: Set Environment Variables (IMPORTANT!)

### Windows 10/11:

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

## 📱 Step 4: Create Android Virtual Device (AVD)

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

## ✅ Step 5: Test Android Emulator

1. **Close all terminals**
2. **Open new PowerShell terminal**
3. **Navigate to project:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```
4. **Start Expo:**
   ```powershell
   npm start -- --clear
   ```
5. **Press 'a' in terminal**
6. **Android emulator should open!**
7. **Wait for emulator to boot** (first time takes 2-3 minutes)
8. **App will load automatically!**

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

## 📊 Quick Checklist

- [ ] Android Studio installed
- [ ] First launch completed
- [ ] ANDROID_HOME environment variable set
- [ ] PATH updated with platform-tools
- [ ] Computer restarted
- [ ] Android Virtual Device (AVD) created
- [ ] Tested with `npm start` and pressed 'a'

## 💡 Pro Tip

**After setup, you can:**
- Press 'a' in terminal to open Android emulator
- Test your app on different Android versions
- Debug Android-specific issues

**But remember:** Your phone with Expo Go is still faster and better for testing!

## ✅ Next Steps

1. **Complete installation** (follow steps above)
2. **Restart computer** (important!)
3. **Test emulator** (press 'a' in terminal)
4. **Enjoy Android development!** 🎉








## ✅ You Downloaded Android Studio - Great!

Now let's set it up properly so you can test on Android emulator.

## 📋 Step 1: Install Android Studio

1. **Run the installer** you downloaded
2. **Choose "Standard" installation**
3. **Wait for installation** (10-15 minutes)
4. **Click "Finish"**

## 🔧 Step 2: First Launch Setup

1. **Android Studio opens automatically**
2. **Choose "Standard" installation** (if asked again)
3. **Accept license agreements**
4. **Click "Finish"**
5. **Wait for SDK download** (5-10 minutes)
6. **Click "Finish"**

## 🌍 Step 3: Set Environment Variables (IMPORTANT!)

### Windows 10/11:

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

## 📱 Step 4: Create Android Virtual Device (AVD)

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

## ✅ Step 5: Test Android Emulator

1. **Close all terminals**
2. **Open new PowerShell terminal**
3. **Navigate to project:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```
4. **Start Expo:**
   ```powershell
   npm start -- --clear
   ```
5. **Press 'a' in terminal**
6. **Android emulator should open!**
7. **Wait for emulator to boot** (first time takes 2-3 minutes)
8. **App will load automatically!**

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

## 📊 Quick Checklist

- [ ] Android Studio installed
- [ ] First launch completed
- [ ] ANDROID_HOME environment variable set
- [ ] PATH updated with platform-tools
- [ ] Computer restarted
- [ ] Android Virtual Device (AVD) created
- [ ] Tested with `npm start` and pressed 'a'

## 💡 Pro Tip

**After setup, you can:**
- Press 'a' in terminal to open Android emulator
- Test your app on different Android versions
- Debug Android-specific issues

**But remember:** Your phone with Expo Go is still faster and better for testing!

## ✅ Next Steps

1. **Complete installation** (follow steps above)
2. **Restart computer** (important!)
3. **Test emulator** (press 'a' in terminal)
4. **Enjoy Android development!** 🎉








## ✅ You Downloaded Android Studio - Great!

Now let's set it up properly so you can test on Android emulator.

## 📋 Step 1: Install Android Studio

1. **Run the installer** you downloaded
2. **Choose "Standard" installation**
3. **Wait for installation** (10-15 minutes)
4. **Click "Finish"**

## 🔧 Step 2: First Launch Setup

1. **Android Studio opens automatically**
2. **Choose "Standard" installation** (if asked again)
3. **Accept license agreements**
4. **Click "Finish"**
5. **Wait for SDK download** (5-10 minutes)
6. **Click "Finish"**

## 🌍 Step 3: Set Environment Variables (IMPORTANT!)

### Windows 10/11:

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

## 📱 Step 4: Create Android Virtual Device (AVD)

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

## ✅ Step 5: Test Android Emulator

1. **Close all terminals**
2. **Open new PowerShell terminal**
3. **Navigate to project:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```
4. **Start Expo:**
   ```powershell
   npm start -- --clear
   ```
5. **Press 'a' in terminal**
6. **Android emulator should open!**
7. **Wait for emulator to boot** (first time takes 2-3 minutes)
8. **App will load automatically!**

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

## 📊 Quick Checklist

- [ ] Android Studio installed
- [ ] First launch completed
- [ ] ANDROID_HOME environment variable set
- [ ] PATH updated with platform-tools
- [ ] Computer restarted
- [ ] Android Virtual Device (AVD) created
- [ ] Tested with `npm start` and pressed 'a'

## 💡 Pro Tip

**After setup, you can:**
- Press 'a' in terminal to open Android emulator
- Test your app on different Android versions
- Debug Android-specific issues

**But remember:** Your phone with Expo Go is still faster and better for testing!

## ✅ Next Steps

1. **Complete installation** (follow steps above)
2. **Restart computer** (important!)
3. **Test emulator** (press 'a' in terminal)
4. **Enjoy Android development!** 🎉









