# 🚀 Quick Start: Run App in Android Emulator

## ✅ EASIEST METHOD (2 Minutes)

### Step 1: Start Android Emulator
1. Open **Android Studio**
2. **Tools → Device Manager**
3. Click **▶️ Start** on an emulator
4. Wait for home screen

### Step 2: Install Expo Go (One Time Only)
1. In emulator, open **Play Store**
2. Search **"Expo Go"**
3. **Install** it
4. Done!

### Step 3: Start Your App
```powershell
cd mobile
npm start
```

### Step 4: Connect from Emulator
1. **Look at terminal** - Find this line:
   ```
   Metro waiting on exp://192.168.1.100:8081
   ```
2. **Copy the URL** (the `exp://...` part)
3. **In emulator:**
   - Open **Expo Go**
   - Tap **"Enter URL manually"**
   - **Paste the URL**
   - Tap **"Connect"**
4. **Your app loads!** 🎉

---

## 🎯 To Make Pressing 'a' Work (One-Time Setup)

Build a development build (takes 15-20 minutes, but then 'a' works forever):

```powershell
# Install EAS CLI
npm install -g eas-cli

# Login
eas login

# Build (one time, 15-20 min)
cd mobile
eas build --profile development --platform android

# Install APK on emulator
# Then pressing 'a' works!
```

---

## 📱 That's It!

✅ **Use Expo Go** - Works immediately  
✅ **Build development build** - Makes 'a' work  
✅ **Both methods work perfectly!**  

**Your app is ready for Android!** 🎉





