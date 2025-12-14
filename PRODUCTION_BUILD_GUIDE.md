# 📱 Build APK for Google Play Store - Complete Guide

## 🎯 Goal
Build a production APK that you can upload to Google Play Store.

## 📋 Prerequisites

1. **Expo Account** (free)
   - Sign up at: https://expo.dev
   - It's free and required for building

2. **Node.js** (already installed ✅)

3. **EAS CLI** (we'll install this)

## 🚀 Step-by-Step Guide

### Step 1: Install EAS CLI

Open PowerShell in the `mobile` folder and run:

```powershell
cd mobile
npm install -g eas-cli
```

### Step 2: Login to Expo

```powershell
eas login
```

Enter your Expo account email and password (create account if needed).

### Step 3: Configure Your App

Your `app.json` is already configured! ✅

### Step 4: Initialize EAS Build

```powershell
eas build:configure
```

This will create an `eas.json` file. Choose:
- **Platform:** Android
- **Build profile:** Production

### Step 5: Build APK

For **APK** (easier to test):
```powershell
eas build --platform android --profile production
```

For **AAB** (required for Google Play Store):
```powershell
eas build --platform android --profile production --type app-bundle
```

### Step 6: Wait for Build

- Build takes 10-20 minutes
- You'll get a link to track progress
- You'll receive email when done

### Step 7: Download APK/AAB

- Go to the build link
- Download the APK or AAB file
- APK: For testing on devices
- AAB: For Google Play Store upload

## 📦 Alternative: Local Build (Advanced)

If you want to build locally (requires Android Studio):

```powershell
npx expo build:android -t apk
```

**Note:** EAS Build (cloud) is easier and recommended for beginners.

## 🎮 Upload to Google Play Store

### Step 1: Create Google Play Console Account
1. Go to: https://play.google.com/console
2. Pay $25 one-time registration fee
3. Create your developer account

### Step 2: Create Your App
1. Click "Create app"
2. Fill in:
   - App name: "HelloOne Bahrain"
   - Default language: English
   - App type: App
   - Free or paid: Free

### Step 3: Upload APK/AAB
1. Go to "Production" → "Create new release"
2. Upload your AAB file (or APK for testing)
3. Fill in release notes

### Step 4: Complete Store Listing
- App icon (512x512)
- Screenshots (at least 2)
- Description
- Privacy policy URL

### Step 5: Submit for Review
- Complete all required sections
- Submit for Google review
- Usually takes 1-3 days

## ⚙️ Important Settings

### App Version
Update version in `app.json`:
```json
{
  "expo": {
    "version": "1.0.0",
    "android": {
      "versionCode": 1
    }
  }
}
```

**Important:** Increase `versionCode` for each new release!

### App Signing
EAS Build automatically signs your app. No manual setup needed! ✅

## 🐛 Troubleshooting

### Build Fails?
- Check error message in build logs
- Make sure all dependencies are installed
- Try: `cd mobile && npm install`

### Can't Login?
- Make sure you created Expo account
- Try: `eas logout` then `eas login` again

### Need Help?
- Expo docs: https://docs.expo.dev/build/introduction/
- EAS Build docs: https://docs.expo.dev/build/introduction/

## ✅ Quick Checklist

- [ ] Expo account created
- [ ] EAS CLI installed
- [ ] Logged in to Expo
- [ ] `eas.json` configured
- [ ] Build started
- [ ] APK/AAB downloaded
- [ ] Google Play Console account created
- [ ] App uploaded to Play Store

## 🎉 You're Ready!

Once your build completes, you'll have an APK/AAB ready for Google Play Store!


## 🎯 Goal
Build a production APK that you can upload to Google Play Store.

## 📋 Prerequisites

1. **Expo Account** (free)
   - Sign up at: https://expo.dev
   - It's free and required for building

2. **Node.js** (already installed ✅)

3. **EAS CLI** (we'll install this)

## 🚀 Step-by-Step Guide

### Step 1: Install EAS CLI

Open PowerShell in the `mobile` folder and run:

```powershell
cd mobile
npm install -g eas-cli
```

### Step 2: Login to Expo

```powershell
eas login
```

Enter your Expo account email and password (create account if needed).

### Step 3: Configure Your App

Your `app.json` is already configured! ✅

### Step 4: Initialize EAS Build

```powershell
eas build:configure
```

This will create an `eas.json` file. Choose:
- **Platform:** Android
- **Build profile:** Production

### Step 5: Build APK

For **APK** (easier to test):
```powershell
eas build --platform android --profile production
```

For **AAB** (required for Google Play Store):
```powershell
eas build --platform android --profile production --type app-bundle
```

### Step 6: Wait for Build

- Build takes 10-20 minutes
- You'll get a link to track progress
- You'll receive email when done

### Step 7: Download APK/AAB

- Go to the build link
- Download the APK or AAB file
- APK: For testing on devices
- AAB: For Google Play Store upload

## 📦 Alternative: Local Build (Advanced)

If you want to build locally (requires Android Studio):

```powershell
npx expo build:android -t apk
```

**Note:** EAS Build (cloud) is easier and recommended for beginners.

## 🎮 Upload to Google Play Store

### Step 1: Create Google Play Console Account
1. Go to: https://play.google.com/console
2. Pay $25 one-time registration fee
3. Create your developer account

### Step 2: Create Your App
1. Click "Create app"
2. Fill in:
   - App name: "HelloOne Bahrain"
   - Default language: English
   - App type: App
   - Free or paid: Free

### Step 3: Upload APK/AAB
1. Go to "Production" → "Create new release"
2. Upload your AAB file (or APK for testing)
3. Fill in release notes

### Step 4: Complete Store Listing
- App icon (512x512)
- Screenshots (at least 2)
- Description
- Privacy policy URL

### Step 5: Submit for Review
- Complete all required sections
- Submit for Google review
- Usually takes 1-3 days

## ⚙️ Important Settings

### App Version
Update version in `app.json`:
```json
{
  "expo": {
    "version": "1.0.0",
    "android": {
      "versionCode": 1
    }
  }
}
```

**Important:** Increase `versionCode` for each new release!

### App Signing
EAS Build automatically signs your app. No manual setup needed! ✅

## 🐛 Troubleshooting

### Build Fails?
- Check error message in build logs
- Make sure all dependencies are installed
- Try: `cd mobile && npm install`

### Can't Login?
- Make sure you created Expo account
- Try: `eas logout` then `eas login` again

### Need Help?
- Expo docs: https://docs.expo.dev/build/introduction/
- EAS Build docs: https://docs.expo.dev/build/introduction/

## ✅ Quick Checklist

- [ ] Expo account created
- [ ] EAS CLI installed
- [ ] Logged in to Expo
- [ ] `eas.json` configured
- [ ] Build started
- [ ] APK/AAB downloaded
- [ ] Google Play Console account created
- [ ] App uploaded to Play Store

## 🎉 You're Ready!

Once your build completes, you'll have an APK/AAB ready for Google Play Store!


## 🎯 Goal
Build a production APK that you can upload to Google Play Store.

## 📋 Prerequisites

1. **Expo Account** (free)
   - Sign up at: https://expo.dev
   - It's free and required for building

2. **Node.js** (already installed ✅)

3. **EAS CLI** (we'll install this)

## 🚀 Step-by-Step Guide

### Step 1: Install EAS CLI

Open PowerShell in the `mobile` folder and run:

```powershell
cd mobile
npm install -g eas-cli
```

### Step 2: Login to Expo

```powershell
eas login
```

Enter your Expo account email and password (create account if needed).

### Step 3: Configure Your App

Your `app.json` is already configured! ✅

### Step 4: Initialize EAS Build

```powershell
eas build:configure
```

This will create an `eas.json` file. Choose:
- **Platform:** Android
- **Build profile:** Production

### Step 5: Build APK

For **APK** (easier to test):
```powershell
eas build --platform android --profile production
```

For **AAB** (required for Google Play Store):
```powershell
eas build --platform android --profile production --type app-bundle
```

### Step 6: Wait for Build

- Build takes 10-20 minutes
- You'll get a link to track progress
- You'll receive email when done

### Step 7: Download APK/AAB

- Go to the build link
- Download the APK or AAB file
- APK: For testing on devices
- AAB: For Google Play Store upload

## 📦 Alternative: Local Build (Advanced)

If you want to build locally (requires Android Studio):

```powershell
npx expo build:android -t apk
```

**Note:** EAS Build (cloud) is easier and recommended for beginners.

## 🎮 Upload to Google Play Store

### Step 1: Create Google Play Console Account
1. Go to: https://play.google.com/console
2. Pay $25 one-time registration fee
3. Create your developer account

### Step 2: Create Your App
1. Click "Create app"
2. Fill in:
   - App name: "HelloOne Bahrain"
   - Default language: English
   - App type: App
   - Free or paid: Free

### Step 3: Upload APK/AAB
1. Go to "Production" → "Create new release"
2. Upload your AAB file (or APK for testing)
3. Fill in release notes

### Step 4: Complete Store Listing
- App icon (512x512)
- Screenshots (at least 2)
- Description
- Privacy policy URL

### Step 5: Submit for Review
- Complete all required sections
- Submit for Google review
- Usually takes 1-3 days

## ⚙️ Important Settings

### App Version
Update version in `app.json`:
```json
{
  "expo": {
    "version": "1.0.0",
    "android": {
      "versionCode": 1
    }
  }
}
```

**Important:** Increase `versionCode` for each new release!

### App Signing
EAS Build automatically signs your app. No manual setup needed! ✅

## 🐛 Troubleshooting

### Build Fails?
- Check error message in build logs
- Make sure all dependencies are installed
- Try: `cd mobile && npm install`

### Can't Login?
- Make sure you created Expo account
- Try: `eas logout` then `eas login` again

### Need Help?
- Expo docs: https://docs.expo.dev/build/introduction/
- EAS Build docs: https://docs.expo.dev/build/introduction/

## ✅ Quick Checklist

- [ ] Expo account created
- [ ] EAS CLI installed
- [ ] Logged in to Expo
- [ ] `eas.json` configured
- [ ] Build started
- [ ] APK/AAB downloaded
- [ ] Google Play Console account created
- [ ] App uploaded to Play Store

## 🎉 You're Ready!

Once your build completes, you'll have an APK/AAB ready for Google Play Store!


## 🎯 Goal
Build a production APK that you can upload to Google Play Store.

## 📋 Prerequisites

1. **Expo Account** (free)
   - Sign up at: https://expo.dev
   - It's free and required for building

2. **Node.js** (already installed ✅)

3. **EAS CLI** (we'll install this)

## 🚀 Step-by-Step Guide

### Step 1: Install EAS CLI

Open PowerShell in the `mobile` folder and run:

```powershell
cd mobile
npm install -g eas-cli
```

### Step 2: Login to Expo

```powershell
eas login
```

Enter your Expo account email and password (create account if needed).

### Step 3: Configure Your App

Your `app.json` is already configured! ✅

### Step 4: Initialize EAS Build

```powershell
eas build:configure
```

This will create an `eas.json` file. Choose:
- **Platform:** Android
- **Build profile:** Production

### Step 5: Build APK

For **APK** (easier to test):
```powershell
eas build --platform android --profile production
```

For **AAB** (required for Google Play Store):
```powershell
eas build --platform android --profile production --type app-bundle
```

### Step 6: Wait for Build

- Build takes 10-20 minutes
- You'll get a link to track progress
- You'll receive email when done

### Step 7: Download APK/AAB

- Go to the build link
- Download the APK or AAB file
- APK: For testing on devices
- AAB: For Google Play Store upload

## 📦 Alternative: Local Build (Advanced)

If you want to build locally (requires Android Studio):

```powershell
npx expo build:android -t apk
```

**Note:** EAS Build (cloud) is easier and recommended for beginners.

## 🎮 Upload to Google Play Store

### Step 1: Create Google Play Console Account
1. Go to: https://play.google.com/console
2. Pay $25 one-time registration fee
3. Create your developer account

### Step 2: Create Your App
1. Click "Create app"
2. Fill in:
   - App name: "HelloOne Bahrain"
   - Default language: English
   - App type: App
   - Free or paid: Free

### Step 3: Upload APK/AAB
1. Go to "Production" → "Create new release"
2. Upload your AAB file (or APK for testing)
3. Fill in release notes

### Step 4: Complete Store Listing
- App icon (512x512)
- Screenshots (at least 2)
- Description
- Privacy policy URL

### Step 5: Submit for Review
- Complete all required sections
- Submit for Google review
- Usually takes 1-3 days

## ⚙️ Important Settings

### App Version
Update version in `app.json`:
```json
{
  "expo": {
    "version": "1.0.0",
    "android": {
      "versionCode": 1
    }
  }
}
```

**Important:** Increase `versionCode` for each new release!

### App Signing
EAS Build automatically signs your app. No manual setup needed! ✅

## 🐛 Troubleshooting

### Build Fails?
- Check error message in build logs
- Make sure all dependencies are installed
- Try: `cd mobile && npm install`

### Can't Login?
- Make sure you created Expo account
- Try: `eas logout` then `eas login` again

### Need Help?
- Expo docs: https://docs.expo.dev/build/introduction/
- EAS Build docs: https://docs.expo.dev/build/introduction/

## ✅ Quick Checklist

- [ ] Expo account created
- [ ] EAS CLI installed
- [ ] Logged in to Expo
- [ ] `eas.json` configured
- [ ] Build started
- [ ] APK/AAB downloaded
- [ ] Google Play Console account created
- [ ] App uploaded to Play Store

## 🎉 You're Ready!

Once your build completes, you'll have an APK/AAB ready for Google Play Store!



