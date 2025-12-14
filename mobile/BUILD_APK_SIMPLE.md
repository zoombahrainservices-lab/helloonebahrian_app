# 📱 Build APK - Simple Step-by-Step Guide

## 🎯 You're New? No Problem! Follow These Steps:

### Step 1: Install EAS CLI (One Time Setup)

Open PowerShell in the `mobile` folder:

```powershell
cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
npm install -g eas-cli
```

Wait for installation to complete.

### Step 2: Create Expo Account (Free)

1. Go to: https://expo.dev
2. Click "Sign Up"
3. Create account (it's free!)
4. Verify your email

### Step 3: Login to Expo

In PowerShell, run:

```powershell
eas login
```

Enter your Expo email and password.

### Step 4: Build Your APK

Run this command:

```powershell
eas build --platform android --profile production
```

**What happens:**
- ✅ EAS will ask some questions (just press Enter for defaults)
- ✅ Build will start (takes 10-20 minutes)
- ✅ You'll get a link to track progress
- ✅ You'll receive email when done

### Step 5: Download Your APK

1. Check your email for build completion
2. Click the link in the email
3. Download the APK file
4. Install on your phone to test!

## 🎮 Upload to Google Play Store

### Step 1: Create Google Play Console Account

1. Go to: https://play.google.com/console
2. Click "Get Started"
3. Pay $25 one-time fee (credit card)
4. Complete registration

### Step 2: Create Your App

1. Click "Create app"
2. Fill in:
   - **App name:** HelloOne Bahrain
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free
3. Click "Create"

### Step 3: Upload APK

1. Go to "Production" tab
2. Click "Create new release"
3. Upload your APK file
4. Add release notes (e.g., "Initial release")
5. Click "Save"

### Step 4: Complete Store Listing

Fill in required information:
- **App icon:** Upload 512x512 image
- **Screenshots:** At least 2 screenshots
- **Description:** Write about your app
- **Privacy policy:** Add URL (can create simple one)

### Step 5: Submit for Review

1. Complete all required sections (marked with *)
2. Click "Submit for review"
3. Wait 1-3 days for Google to approve

## ⚠️ Important Notes

### For Each New Update:
1. Update version in `app.json`:
   ```json
   "version": "1.0.1",
   "android": {
     "versionCode": 2
   }
   ```
2. Build again with same command
3. Upload new APK to Play Store

### Build Types:
- **APK:** For testing, easier to install
- **AAB (App Bundle):** Required for Google Play Store (better compression)

To build AAB instead:
```powershell
eas build --platform android --profile production --type app-bundle
```

## 🐛 Troubleshooting

### "Command not found: eas"
- Make sure you installed: `npm install -g eas-cli`
- Try: `npx eas-cli login` instead

### "Not logged in"
- Run: `eas login`
- Make sure you created Expo account

### Build Fails
- Check the error message
- Make sure all files are saved
- Try: `cd mobile && npm install` first

## ✅ Quick Checklist

- [ ] Expo account created
- [ ] EAS CLI installed (`npm install -g eas-cli`)
- [ ] Logged in (`eas login`)
- [ ] Build started (`eas build --platform android --profile production`)
- [ ] APK downloaded
- [ ] Google Play Console account created ($25)
- [ ] App created in Play Console
- [ ] APK uploaded
- [ ] Store listing completed
- [ ] Submitted for review

## 🎉 That's It!

Once Google approves, your app will be live on Google Play Store!

**Need help?** Check the error message or ask me!


## 🎯 You're New? No Problem! Follow These Steps:

### Step 1: Install EAS CLI (One Time Setup)

Open PowerShell in the `mobile` folder:

```powershell
cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
npm install -g eas-cli
```

Wait for installation to complete.

### Step 2: Create Expo Account (Free)

1. Go to: https://expo.dev
2. Click "Sign Up"
3. Create account (it's free!)
4. Verify your email

### Step 3: Login to Expo

In PowerShell, run:

```powershell
eas login
```

Enter your Expo email and password.

### Step 4: Build Your APK

Run this command:

```powershell
eas build --platform android --profile production
```

**What happens:**
- ✅ EAS will ask some questions (just press Enter for defaults)
- ✅ Build will start (takes 10-20 minutes)
- ✅ You'll get a link to track progress
- ✅ You'll receive email when done

### Step 5: Download Your APK

1. Check your email for build completion
2. Click the link in the email
3. Download the APK file
4. Install on your phone to test!

## 🎮 Upload to Google Play Store

### Step 1: Create Google Play Console Account

1. Go to: https://play.google.com/console
2. Click "Get Started"
3. Pay $25 one-time fee (credit card)
4. Complete registration

### Step 2: Create Your App

1. Click "Create app"
2. Fill in:
   - **App name:** HelloOne Bahrain
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free
3. Click "Create"

### Step 3: Upload APK

1. Go to "Production" tab
2. Click "Create new release"
3. Upload your APK file
4. Add release notes (e.g., "Initial release")
5. Click "Save"

### Step 4: Complete Store Listing

Fill in required information:
- **App icon:** Upload 512x512 image
- **Screenshots:** At least 2 screenshots
- **Description:** Write about your app
- **Privacy policy:** Add URL (can create simple one)

### Step 5: Submit for Review

1. Complete all required sections (marked with *)
2. Click "Submit for review"
3. Wait 1-3 days for Google to approve

## ⚠️ Important Notes

### For Each New Update:
1. Update version in `app.json`:
   ```json
   "version": "1.0.1",
   "android": {
     "versionCode": 2
   }
   ```
2. Build again with same command
3. Upload new APK to Play Store

### Build Types:
- **APK:** For testing, easier to install
- **AAB (App Bundle):** Required for Google Play Store (better compression)

To build AAB instead:
```powershell
eas build --platform android --profile production --type app-bundle
```

## 🐛 Troubleshooting

### "Command not found: eas"
- Make sure you installed: `npm install -g eas-cli`
- Try: `npx eas-cli login` instead

### "Not logged in"
- Run: `eas login`
- Make sure you created Expo account

### Build Fails
- Check the error message
- Make sure all files are saved
- Try: `cd mobile && npm install` first

## ✅ Quick Checklist

- [ ] Expo account created
- [ ] EAS CLI installed (`npm install -g eas-cli`)
- [ ] Logged in (`eas login`)
- [ ] Build started (`eas build --platform android --profile production`)
- [ ] APK downloaded
- [ ] Google Play Console account created ($25)
- [ ] App created in Play Console
- [ ] APK uploaded
- [ ] Store listing completed
- [ ] Submitted for review

## 🎉 That's It!

Once Google approves, your app will be live on Google Play Store!

**Need help?** Check the error message or ask me!


## 🎯 You're New? No Problem! Follow These Steps:

### Step 1: Install EAS CLI (One Time Setup)

Open PowerShell in the `mobile` folder:

```powershell
cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
npm install -g eas-cli
```

Wait for installation to complete.

### Step 2: Create Expo Account (Free)

1. Go to: https://expo.dev
2. Click "Sign Up"
3. Create account (it's free!)
4. Verify your email

### Step 3: Login to Expo

In PowerShell, run:

```powershell
eas login
```

Enter your Expo email and password.

### Step 4: Build Your APK

Run this command:

```powershell
eas build --platform android --profile production
```

**What happens:**
- ✅ EAS will ask some questions (just press Enter for defaults)
- ✅ Build will start (takes 10-20 minutes)
- ✅ You'll get a link to track progress
- ✅ You'll receive email when done

### Step 5: Download Your APK

1. Check your email for build completion
2. Click the link in the email
3. Download the APK file
4. Install on your phone to test!

## 🎮 Upload to Google Play Store

### Step 1: Create Google Play Console Account

1. Go to: https://play.google.com/console
2. Click "Get Started"
3. Pay $25 one-time fee (credit card)
4. Complete registration

### Step 2: Create Your App

1. Click "Create app"
2. Fill in:
   - **App name:** HelloOne Bahrain
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free
3. Click "Create"

### Step 3: Upload APK

1. Go to "Production" tab
2. Click "Create new release"
3. Upload your APK file
4. Add release notes (e.g., "Initial release")
5. Click "Save"

### Step 4: Complete Store Listing

Fill in required information:
- **App icon:** Upload 512x512 image
- **Screenshots:** At least 2 screenshots
- **Description:** Write about your app
- **Privacy policy:** Add URL (can create simple one)

### Step 5: Submit for Review

1. Complete all required sections (marked with *)
2. Click "Submit for review"
3. Wait 1-3 days for Google to approve

## ⚠️ Important Notes

### For Each New Update:
1. Update version in `app.json`:
   ```json
   "version": "1.0.1",
   "android": {
     "versionCode": 2
   }
   ```
2. Build again with same command
3. Upload new APK to Play Store

### Build Types:
- **APK:** For testing, easier to install
- **AAB (App Bundle):** Required for Google Play Store (better compression)

To build AAB instead:
```powershell
eas build --platform android --profile production --type app-bundle
```

## 🐛 Troubleshooting

### "Command not found: eas"
- Make sure you installed: `npm install -g eas-cli`
- Try: `npx eas-cli login` instead

### "Not logged in"
- Run: `eas login`
- Make sure you created Expo account

### Build Fails
- Check the error message
- Make sure all files are saved
- Try: `cd mobile && npm install` first

## ✅ Quick Checklist

- [ ] Expo account created
- [ ] EAS CLI installed (`npm install -g eas-cli`)
- [ ] Logged in (`eas login`)
- [ ] Build started (`eas build --platform android --profile production`)
- [ ] APK downloaded
- [ ] Google Play Console account created ($25)
- [ ] App created in Play Console
- [ ] APK uploaded
- [ ] Store listing completed
- [ ] Submitted for review

## 🎉 That's It!

Once Google approves, your app will be live on Google Play Store!

**Need help?** Check the error message or ask me!


## 🎯 You're New? No Problem! Follow These Steps:

### Step 1: Install EAS CLI (One Time Setup)

Open PowerShell in the `mobile` folder:

```powershell
cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
npm install -g eas-cli
```

Wait for installation to complete.

### Step 2: Create Expo Account (Free)

1. Go to: https://expo.dev
2. Click "Sign Up"
3. Create account (it's free!)
4. Verify your email

### Step 3: Login to Expo

In PowerShell, run:

```powershell
eas login
```

Enter your Expo email and password.

### Step 4: Build Your APK

Run this command:

```powershell
eas build --platform android --profile production
```

**What happens:**
- ✅ EAS will ask some questions (just press Enter for defaults)
- ✅ Build will start (takes 10-20 minutes)
- ✅ You'll get a link to track progress
- ✅ You'll receive email when done

### Step 5: Download Your APK

1. Check your email for build completion
2. Click the link in the email
3. Download the APK file
4. Install on your phone to test!

## 🎮 Upload to Google Play Store

### Step 1: Create Google Play Console Account

1. Go to: https://play.google.com/console
2. Click "Get Started"
3. Pay $25 one-time fee (credit card)
4. Complete registration

### Step 2: Create Your App

1. Click "Create app"
2. Fill in:
   - **App name:** HelloOne Bahrain
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free
3. Click "Create"

### Step 3: Upload APK

1. Go to "Production" tab
2. Click "Create new release"
3. Upload your APK file
4. Add release notes (e.g., "Initial release")
5. Click "Save"

### Step 4: Complete Store Listing

Fill in required information:
- **App icon:** Upload 512x512 image
- **Screenshots:** At least 2 screenshots
- **Description:** Write about your app
- **Privacy policy:** Add URL (can create simple one)

### Step 5: Submit for Review

1. Complete all required sections (marked with *)
2. Click "Submit for review"
3. Wait 1-3 days for Google to approve

## ⚠️ Important Notes

### For Each New Update:
1. Update version in `app.json`:
   ```json
   "version": "1.0.1",
   "android": {
     "versionCode": 2
   }
   ```
2. Build again with same command
3. Upload new APK to Play Store

### Build Types:
- **APK:** For testing, easier to install
- **AAB (App Bundle):** Required for Google Play Store (better compression)

To build AAB instead:
```powershell
eas build --platform android --profile production --type app-bundle
```

## 🐛 Troubleshooting

### "Command not found: eas"
- Make sure you installed: `npm install -g eas-cli`
- Try: `npx eas-cli login` instead

### "Not logged in"
- Run: `eas login`
- Make sure you created Expo account

### Build Fails
- Check the error message
- Make sure all files are saved
- Try: `cd mobile && npm install` first

## ✅ Quick Checklist

- [ ] Expo account created
- [ ] EAS CLI installed (`npm install -g eas-cli`)
- [ ] Logged in (`eas login`)
- [ ] Build started (`eas build --platform android --profile production`)
- [ ] APK downloaded
- [ ] Google Play Console account created ($25)
- [ ] App created in Play Console
- [ ] APK uploaded
- [ ] Store listing completed
- [ ] Submitted for review

## 🎉 That's It!

Once Google approves, your app will be live on Google Play Store!

**Need help?** Check the error message or ask me!



