# 🤖 Android Studio Setup (Optional - Only if You Need Emulator)

## ⚠️ Important: You Don't Need This!

**Your app works perfectly on:**
- ✅ Web browser (you're using it!)
- ✅ Your phone with Expo Go (recommended!)

**You only need Android Studio if:**
- You don't have a phone
- You need to test specific Android versions
- You're doing advanced development

## 📥 Step 1: Download Android Studio

1. Go to: https://developer.android.com/studio
2. Click "Download Android Studio"
3. Download installer (large file, ~1GB)
4. Run installer

## 🔧 Step 2: Install Android Studio

1. Run the installer
2. Follow installation wizard
3. Choose "Standard" installation
4. Wait for download (10-15 minutes)
5. Click "Finish"

## 🌍 Step 3: Set Environment Variables

### Windows 10/11:

1. **Open Settings:**
   - Press `Windows + X`
   - Click "System"
   - Click "About"
   - Click "Advanced system settings"

2. **Add ANDROID_HOME:**
   - Click "Environment Variables"
   - Under "System variables", click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click "OK"

3. **Add to PATH:**
   - In Environment Variables, find "Path" in System variables
   - Click "Edit"
   - Click "New"
   - Add: `%ANDROID_HOME%\platform-tools`
   - Click "OK" on all dialogs

4. **Restart Computer:**
   - Close all terminals
   - Restart Windows
   - This is important for environment variables to take effect

## 📱 Step 4: Create Android Virtual Device (AVD)

1. **Open Android Studio:**
   - Launch Android Studio
   - Click "More Actions" → "Virtual Device Manager"

2. **Create Device:**
   - Click "Create Device"
   - Choose a device (e.g., "Pixel 5")
   - Click "Next"

3. **Download System Image:**
   - Choose a system image (e.g., "Tiramisu" API 33)
   - Click "Download" if needed
   - Wait for download
   - Click "Next"

4. **Finish Setup:**
   - Click "Finish"
   - Your AVD is ready!

## ✅ Step 5: Test

1. **Close all terminals**
2. **Open new terminal**
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

## 🐛 Troubleshooting

### Error: "ANDROID_HOME not found"
- Make sure you restarted your computer after setting environment variables
- Check if path is correct: `C:\Users\Farzeen\AppData\Local\Android\Sdk`

### Error: "adb not recognized"
- Make sure `%ANDROID_HOME%\platform-tools` is in PATH
- Restart terminal after adding to PATH

### Emulator is slow
- This is normal - emulators are slower than real devices
- Use your phone instead for better performance!

### Still not working?
- Use your phone with Expo Go instead - it's easier and faster!

## 💡 Pro Tip

**Just use your phone!** It's:
- ✅ Faster to set up
- ✅ Better performance
- ✅ More realistic testing
- ✅ Works on both Android and iOS

You don't need Android Studio unless you specifically need an emulator!








## ⚠️ Important: You Don't Need This!

**Your app works perfectly on:**
- ✅ Web browser (you're using it!)
- ✅ Your phone with Expo Go (recommended!)

**You only need Android Studio if:**
- You don't have a phone
- You need to test specific Android versions
- You're doing advanced development

## 📥 Step 1: Download Android Studio

1. Go to: https://developer.android.com/studio
2. Click "Download Android Studio"
3. Download installer (large file, ~1GB)
4. Run installer

## 🔧 Step 2: Install Android Studio

1. Run the installer
2. Follow installation wizard
3. Choose "Standard" installation
4. Wait for download (10-15 minutes)
5. Click "Finish"

## 🌍 Step 3: Set Environment Variables

### Windows 10/11:

1. **Open Settings:**
   - Press `Windows + X`
   - Click "System"
   - Click "About"
   - Click "Advanced system settings"

2. **Add ANDROID_HOME:**
   - Click "Environment Variables"
   - Under "System variables", click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click "OK"

3. **Add to PATH:**
   - In Environment Variables, find "Path" in System variables
   - Click "Edit"
   - Click "New"
   - Add: `%ANDROID_HOME%\platform-tools`
   - Click "OK" on all dialogs

4. **Restart Computer:**
   - Close all terminals
   - Restart Windows
   - This is important for environment variables to take effect

## 📱 Step 4: Create Android Virtual Device (AVD)

1. **Open Android Studio:**
   - Launch Android Studio
   - Click "More Actions" → "Virtual Device Manager"

2. **Create Device:**
   - Click "Create Device"
   - Choose a device (e.g., "Pixel 5")
   - Click "Next"

3. **Download System Image:**
   - Choose a system image (e.g., "Tiramisu" API 33)
   - Click "Download" if needed
   - Wait for download
   - Click "Next"

4. **Finish Setup:**
   - Click "Finish"
   - Your AVD is ready!

## ✅ Step 5: Test

1. **Close all terminals**
2. **Open new terminal**
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

## 🐛 Troubleshooting

### Error: "ANDROID_HOME not found"
- Make sure you restarted your computer after setting environment variables
- Check if path is correct: `C:\Users\Farzeen\AppData\Local\Android\Sdk`

### Error: "adb not recognized"
- Make sure `%ANDROID_HOME%\platform-tools` is in PATH
- Restart terminal after adding to PATH

### Emulator is slow
- This is normal - emulators are slower than real devices
- Use your phone instead for better performance!

### Still not working?
- Use your phone with Expo Go instead - it's easier and faster!

## 💡 Pro Tip

**Just use your phone!** It's:
- ✅ Faster to set up
- ✅ Better performance
- ✅ More realistic testing
- ✅ Works on both Android and iOS

You don't need Android Studio unless you specifically need an emulator!








## ⚠️ Important: You Don't Need This!

**Your app works perfectly on:**
- ✅ Web browser (you're using it!)
- ✅ Your phone with Expo Go (recommended!)

**You only need Android Studio if:**
- You don't have a phone
- You need to test specific Android versions
- You're doing advanced development

## 📥 Step 1: Download Android Studio

1. Go to: https://developer.android.com/studio
2. Click "Download Android Studio"
3. Download installer (large file, ~1GB)
4. Run installer

## 🔧 Step 2: Install Android Studio

1. Run the installer
2. Follow installation wizard
3. Choose "Standard" installation
4. Wait for download (10-15 minutes)
5. Click "Finish"

## 🌍 Step 3: Set Environment Variables

### Windows 10/11:

1. **Open Settings:**
   - Press `Windows + X`
   - Click "System"
   - Click "About"
   - Click "Advanced system settings"

2. **Add ANDROID_HOME:**
   - Click "Environment Variables"
   - Under "System variables", click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click "OK"

3. **Add to PATH:**
   - In Environment Variables, find "Path" in System variables
   - Click "Edit"
   - Click "New"
   - Add: `%ANDROID_HOME%\platform-tools`
   - Click "OK" on all dialogs

4. **Restart Computer:**
   - Close all terminals
   - Restart Windows
   - This is important for environment variables to take effect

## 📱 Step 4: Create Android Virtual Device (AVD)

1. **Open Android Studio:**
   - Launch Android Studio
   - Click "More Actions" → "Virtual Device Manager"

2. **Create Device:**
   - Click "Create Device"
   - Choose a device (e.g., "Pixel 5")
   - Click "Next"

3. **Download System Image:**
   - Choose a system image (e.g., "Tiramisu" API 33)
   - Click "Download" if needed
   - Wait for download
   - Click "Next"

4. **Finish Setup:**
   - Click "Finish"
   - Your AVD is ready!

## ✅ Step 5: Test

1. **Close all terminals**
2. **Open new terminal**
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

## 🐛 Troubleshooting

### Error: "ANDROID_HOME not found"
- Make sure you restarted your computer after setting environment variables
- Check if path is correct: `C:\Users\Farzeen\AppData\Local\Android\Sdk`

### Error: "adb not recognized"
- Make sure `%ANDROID_HOME%\platform-tools` is in PATH
- Restart terminal after adding to PATH

### Emulator is slow
- This is normal - emulators are slower than real devices
- Use your phone instead for better performance!

### Still not working?
- Use your phone with Expo Go instead - it's easier and faster!

## 💡 Pro Tip

**Just use your phone!** It's:
- ✅ Faster to set up
- ✅ Better performance
- ✅ More realistic testing
- ✅ Works on both Android and iOS

You don't need Android Studio unless you specifically need an emulator!








## ⚠️ Important: You Don't Need This!

**Your app works perfectly on:**
- ✅ Web browser (you're using it!)
- ✅ Your phone with Expo Go (recommended!)

**You only need Android Studio if:**
- You don't have a phone
- You need to test specific Android versions
- You're doing advanced development

## 📥 Step 1: Download Android Studio

1. Go to: https://developer.android.com/studio
2. Click "Download Android Studio"
3. Download installer (large file, ~1GB)
4. Run installer

## 🔧 Step 2: Install Android Studio

1. Run the installer
2. Follow installation wizard
3. Choose "Standard" installation
4. Wait for download (10-15 minutes)
5. Click "Finish"

## 🌍 Step 3: Set Environment Variables

### Windows 10/11:

1. **Open Settings:**
   - Press `Windows + X`
   - Click "System"
   - Click "About"
   - Click "Advanced system settings"

2. **Add ANDROID_HOME:**
   - Click "Environment Variables"
   - Under "System variables", click "New"
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Users\Farzeen\AppData\Local\Android\Sdk`
   - Click "OK"

3. **Add to PATH:**
   - In Environment Variables, find "Path" in System variables
   - Click "Edit"
   - Click "New"
   - Add: `%ANDROID_HOME%\platform-tools`
   - Click "OK" on all dialogs

4. **Restart Computer:**
   - Close all terminals
   - Restart Windows
   - This is important for environment variables to take effect

## 📱 Step 4: Create Android Virtual Device (AVD)

1. **Open Android Studio:**
   - Launch Android Studio
   - Click "More Actions" → "Virtual Device Manager"

2. **Create Device:**
   - Click "Create Device"
   - Choose a device (e.g., "Pixel 5")
   - Click "Next"

3. **Download System Image:**
   - Choose a system image (e.g., "Tiramisu" API 33)
   - Click "Download" if needed
   - Wait for download
   - Click "Next"

4. **Finish Setup:**
   - Click "Finish"
   - Your AVD is ready!

## ✅ Step 5: Test

1. **Close all terminals**
2. **Open new terminal**
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

## 🐛 Troubleshooting

### Error: "ANDROID_HOME not found"
- Make sure you restarted your computer after setting environment variables
- Check if path is correct: `C:\Users\Farzeen\AppData\Local\Android\Sdk`

### Error: "adb not recognized"
- Make sure `%ANDROID_HOME%\platform-tools` is in PATH
- Restart terminal after adding to PATH

### Emulator is slow
- This is normal - emulators are slower than real devices
- Use your phone instead for better performance!

### Still not working?
- Use your phone with Expo Go instead - it's easier and faster!

## 💡 Pro Tip

**Just use your phone!** It's:
- ✅ Faster to set up
- ✅ Better performance
- ✅ More realistic testing
- ✅ Works on both Android and iOS

You don't need Android Studio unless you specifically need an emulator!









