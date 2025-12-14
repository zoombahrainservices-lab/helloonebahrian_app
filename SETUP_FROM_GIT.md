# 🚀 Setup Project from Git Repository

## ✅ You're Using Git Repo - Great!

This is actually **better** because:
- ✅ No OneDrive file locking issues
- ✅ Clean project structure
- ✅ Easy to update with `git pull`

## 📋 Setup Steps

### Step 1: Install Dependencies

Open PowerShell in the project root and run:

```powershell
# Install root dependencies
npm install

# Install mobile app dependencies
cd mobile
npm install
```

### Step 2: Verify Setup

Check that everything is installed:

```powershell
cd mobile
npm list --depth=0
```

### Step 3: Run the App

#### Option A: Run in Development Mode

```powershell
cd mobile
npx expo start
```

Then:
- Press `w` for web
- Press `a` for Android (requires emulator or connected device)
- Scan QR code with Expo Go app on your phone

#### Option B: Build APK for Production

Since you're not in OneDrive anymore, you can build directly:

```powershell
cd mobile
eas build --platform android --profile production
```

**OR** use the build script (still works):

```powershell
cd mobile
.\build-apk.ps1
```

## 🔧 Configuration Check

Make sure these files exist and are configured:

1. **`mobile/app.json`** - Expo configuration ✅
2. **`mobile/eas.json`** - EAS Build configuration ✅
3. **`.easignore`** - Build ignore file ✅

## 📱 Build APK

### Quick Build (Recommended)

```powershell
cd mobile
eas build --platform android --profile production
```

### Using Build Script

```powershell
cd mobile
.\build-apk.ps1
```

## 🔄 Update from Git

To get latest changes:

```powershell
git pull origin main
cd mobile
npm install  # If new dependencies were added
```

## ✅ Verify Everything Works

1. **Check dependencies:**
   ```powershell
   cd mobile
   npm list expo eas-cli
   ```

2. **Check EAS login:**
   ```powershell
   eas whoami
   ```

3. **Test build configuration:**
   ```powershell
   eas build:configure
   ```

## 🎯 Next Steps

1. ✅ Install dependencies (`npm install` in mobile folder)
2. ✅ Login to EAS (`eas login`)
3. ✅ Build APK (`eas build --platform android --profile production`)

## 💡 Tips

- **No OneDrive issues:** Since you're using git repo, files won't be locked!
- **Easy updates:** Just run `git pull` to get latest changes
- **Clean builds:** Build directly without the temp copy script (though it still works)

## 🚀 Ready to Build!

You're all set! Run:

```powershell
cd mobile
npm install
eas build --platform android --profile production
```

Good luck! 🎉


## ✅ You're Using Git Repo - Great!

This is actually **better** because:
- ✅ No OneDrive file locking issues
- ✅ Clean project structure
- ✅ Easy to update with `git pull`

## 📋 Setup Steps

### Step 1: Install Dependencies

Open PowerShell in the project root and run:

```powershell
# Install root dependencies
npm install

# Install mobile app dependencies
cd mobile
npm install
```

### Step 2: Verify Setup

Check that everything is installed:

```powershell
cd mobile
npm list --depth=0
```

### Step 3: Run the App

#### Option A: Run in Development Mode

```powershell
cd mobile
npx expo start
```

Then:
- Press `w` for web
- Press `a` for Android (requires emulator or connected device)
- Scan QR code with Expo Go app on your phone

#### Option B: Build APK for Production

Since you're not in OneDrive anymore, you can build directly:

```powershell
cd mobile
eas build --platform android --profile production
```

**OR** use the build script (still works):

```powershell
cd mobile
.\build-apk.ps1
```

## 🔧 Configuration Check

Make sure these files exist and are configured:

1. **`mobile/app.json`** - Expo configuration ✅
2. **`mobile/eas.json`** - EAS Build configuration ✅
3. **`.easignore`** - Build ignore file ✅

## 📱 Build APK

### Quick Build (Recommended)

```powershell
cd mobile
eas build --platform android --profile production
```

### Using Build Script

```powershell
cd mobile
.\build-apk.ps1
```

## 🔄 Update from Git

To get latest changes:

```powershell
git pull origin main
cd mobile
npm install  # If new dependencies were added
```

## ✅ Verify Everything Works

1. **Check dependencies:**
   ```powershell
   cd mobile
   npm list expo eas-cli
   ```

2. **Check EAS login:**
   ```powershell
   eas whoami
   ```

3. **Test build configuration:**
   ```powershell
   eas build:configure
   ```

## 🎯 Next Steps

1. ✅ Install dependencies (`npm install` in mobile folder)
2. ✅ Login to EAS (`eas login`)
3. ✅ Build APK (`eas build --platform android --profile production`)

## 💡 Tips

- **No OneDrive issues:** Since you're using git repo, files won't be locked!
- **Easy updates:** Just run `git pull` to get latest changes
- **Clean builds:** Build directly without the temp copy script (though it still works)

## 🚀 Ready to Build!

You're all set! Run:

```powershell
cd mobile
npm install
eas build --platform android --profile production
```

Good luck! 🎉


## ✅ You're Using Git Repo - Great!

This is actually **better** because:
- ✅ No OneDrive file locking issues
- ✅ Clean project structure
- ✅ Easy to update with `git pull`

## 📋 Setup Steps

### Step 1: Install Dependencies

Open PowerShell in the project root and run:

```powershell
# Install root dependencies
npm install

# Install mobile app dependencies
cd mobile
npm install
```

### Step 2: Verify Setup

Check that everything is installed:

```powershell
cd mobile
npm list --depth=0
```

### Step 3: Run the App

#### Option A: Run in Development Mode

```powershell
cd mobile
npx expo start
```

Then:
- Press `w` for web
- Press `a` for Android (requires emulator or connected device)
- Scan QR code with Expo Go app on your phone

#### Option B: Build APK for Production

Since you're not in OneDrive anymore, you can build directly:

```powershell
cd mobile
eas build --platform android --profile production
```

**OR** use the build script (still works):

```powershell
cd mobile
.\build-apk.ps1
```

## 🔧 Configuration Check

Make sure these files exist and are configured:

1. **`mobile/app.json`** - Expo configuration ✅
2. **`mobile/eas.json`** - EAS Build configuration ✅
3. **`.easignore`** - Build ignore file ✅

## 📱 Build APK

### Quick Build (Recommended)

```powershell
cd mobile
eas build --platform android --profile production
```

### Using Build Script

```powershell
cd mobile
.\build-apk.ps1
```

## 🔄 Update from Git

To get latest changes:

```powershell
git pull origin main
cd mobile
npm install  # If new dependencies were added
```

## ✅ Verify Everything Works

1. **Check dependencies:**
   ```powershell
   cd mobile
   npm list expo eas-cli
   ```

2. **Check EAS login:**
   ```powershell
   eas whoami
   ```

3. **Test build configuration:**
   ```powershell
   eas build:configure
   ```

## 🎯 Next Steps

1. ✅ Install dependencies (`npm install` in mobile folder)
2. ✅ Login to EAS (`eas login`)
3. ✅ Build APK (`eas build --platform android --profile production`)

## 💡 Tips

- **No OneDrive issues:** Since you're using git repo, files won't be locked!
- **Easy updates:** Just run `git pull` to get latest changes
- **Clean builds:** Build directly without the temp copy script (though it still works)

## 🚀 Ready to Build!

You're all set! Run:

```powershell
cd mobile
npm install
eas build --platform android --profile production
```

Good luck! 🎉


## ✅ You're Using Git Repo - Great!

This is actually **better** because:
- ✅ No OneDrive file locking issues
- ✅ Clean project structure
- ✅ Easy to update with `git pull`

## 📋 Setup Steps

### Step 1: Install Dependencies

Open PowerShell in the project root and run:

```powershell
# Install root dependencies
npm install

# Install mobile app dependencies
cd mobile
npm install
```

### Step 2: Verify Setup

Check that everything is installed:

```powershell
cd mobile
npm list --depth=0
```

### Step 3: Run the App

#### Option A: Run in Development Mode

```powershell
cd mobile
npx expo start
```

Then:
- Press `w` for web
- Press `a` for Android (requires emulator or connected device)
- Scan QR code with Expo Go app on your phone

#### Option B: Build APK for Production

Since you're not in OneDrive anymore, you can build directly:

```powershell
cd mobile
eas build --platform android --profile production
```

**OR** use the build script (still works):

```powershell
cd mobile
.\build-apk.ps1
```

## 🔧 Configuration Check

Make sure these files exist and are configured:

1. **`mobile/app.json`** - Expo configuration ✅
2. **`mobile/eas.json`** - EAS Build configuration ✅
3. **`.easignore`** - Build ignore file ✅

## 📱 Build APK

### Quick Build (Recommended)

```powershell
cd mobile
eas build --platform android --profile production
```

### Using Build Script

```powershell
cd mobile
.\build-apk.ps1
```

## 🔄 Update from Git

To get latest changes:

```powershell
git pull origin main
cd mobile
npm install  # If new dependencies were added
```

## ✅ Verify Everything Works

1. **Check dependencies:**
   ```powershell
   cd mobile
   npm list expo eas-cli
   ```

2. **Check EAS login:**
   ```powershell
   eas whoami
   ```

3. **Test build configuration:**
   ```powershell
   eas build:configure
   ```

## 🎯 Next Steps

1. ✅ Install dependencies (`npm install` in mobile folder)
2. ✅ Login to EAS (`eas login`)
3. ✅ Build APK (`eas build --platform android --profile production`)

## 💡 Tips

- **No OneDrive issues:** Since you're using git repo, files won't be locked!
- **Easy updates:** Just run `git pull` to get latest changes
- **Clean builds:** Build directly without the temp copy script (though it still works)

## 🚀 Ready to Build!

You're all set! Run:

```powershell
cd mobile
npm install
eas build --platform android --profile production
```

Good luck! 🎉



