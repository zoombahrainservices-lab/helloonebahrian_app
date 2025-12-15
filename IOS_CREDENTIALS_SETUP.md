# 📱 iOS Credentials Setup for EAS Build

## 🎯 Goal
Set up iOS build credentials so you can build for both iOS and Android.

## 📋 Prerequisites

### 1. Apple Developer Account
- **Cost:** $99/year (required for App Store)
- **Sign up:** https://developer.apple.com/programs/
- **Note:** You can test on your own device without paid account, but App Store requires paid account

### 2. EAS CLI Installed
```powershell
npm install -g eas-cli
```

### 3. Logged into Expo
```powershell
eas login
```

## 🚀 Step-by-Step Setup

### Step 1: Configure iOS Credentials

Run this command:

```powershell
cd mobile
eas credentials
```

### Step 2: Select Platform

You'll see:
```
? Select platform
❯ iOS
  Android
  All
```

**Select:** `iOS` (press Enter)

### Step 3: Choose Credential Management

You'll see:
```
? What would you like to do?
❯ Set up new credentials
  Use existing credentials
  Remove credentials
```

**Select:** `Set up new credentials` (press Enter)

### Step 4: Choose Credential Provider

You'll see:
```
? How would you like to upload your credentials?
❯ Expo handles all credentials, you can still provide overrides
  I want to upload my own credentials
```

**Select:** `Expo handles all credentials` (press Enter)

**This is the easiest option!** Expo will:
- Generate certificates automatically
- Manage provisioning profiles
- Handle everything for you

### Step 5: Provide Apple Developer Account

Expo will ask for your Apple Developer credentials:

1. **Apple ID:** Your Apple Developer account email
2. **Password:** Your Apple Developer account password
3. **App-Specific Password:** (if 2FA is enabled)
   - Generate at: https://appleid.apple.com/account/manage
   - Go to "App-Specific Passwords"
   - Create a new password for Expo

### Step 6: Wait for Setup

Expo will:
- ✅ Create certificates
- ✅ Generate provisioning profiles
- ✅ Configure everything automatically

This takes 2-5 minutes.

### Step 7: Verify Setup

After setup completes, you'll see:
```
✓ iOS credentials configured successfully
```

## 🏗️ Building for Both Platforms

### Build Android Only:
```powershell
eas build --platform android --profile production
```

### Build iOS Only:
```powershell
eas build --platform ios --profile production
```

### Build Both:
```powershell
eas build --platform all --profile production
```

## ⚙️ Alternative: Manual Credential Setup

If you prefer to manage credentials yourself:

### Option 1: Upload Existing Credentials

If you already have:
- Distribution certificate (.p12)
- Provisioning profile (.mobileprovision)

```powershell
eas credentials
# Select: iOS
# Select: I want to upload my own credentials
# Follow prompts to upload files
```

### Option 2: Generate Locally (Advanced)

Requires Xcode and Mac:
```powershell
eas credentials --local
```

## 📋 What Gets Created

When Expo manages credentials, it creates:

1. **Distribution Certificate**
   - Used to sign your app
   - Stored securely in EAS

2. **Provisioning Profile**
   - Links your app to your Apple Developer account
   - Required for App Store distribution

3. **App Store Connect API Key** (optional)
   - For automated submissions

## 🔐 Security Notes

- ✅ Credentials are stored securely in EAS
- ✅ Only you can access them
- ✅ Encrypted and protected
- ✅ Can be revoked/regenerated anytime

## ⚠️ Important Notes

### Free Apple Developer Account
- Can test on your own devices
- **Cannot** publish to App Store
- **Cannot** use TestFlight
- **Cannot** distribute to others

### Paid Apple Developer Account ($99/year)
- ✅ Publish to App Store
- ✅ Use TestFlight
- ✅ Distribute to others
- ✅ Full access to all features

### Two-Factor Authentication
If your Apple ID has 2FA enabled:
1. You'll need an App-Specific Password
2. Generate at: https://appleid.apple.com/account/manage
3. Use this password when prompted

## 🎯 Quick Start (Recommended)

**Easiest way - Let Expo handle everything:**

```powershell
cd mobile
eas credentials
# Select: iOS
# Select: Set up new credentials
# Select: Expo handles all credentials
# Enter Apple Developer account info
# Wait for setup to complete
```

That's it! Expo will handle everything automatically.

## 📱 After Setup

Once credentials are configured:

1. **Build iOS:**
   ```powershell
   eas build --platform ios --profile production
   ```

2. **Build Both:**
   ```powershell
   eas build --platform all --profile production
   ```

3. **Check Status:**
   - Visit: https://expo.dev
   - Go to your project
   - Check "Builds" section

## 🔗 Resources

- **Apple Developer:** https://developer.apple.com
- **EAS Credentials Docs:** https://docs.expo.dev/app-signing/managed-credentials/
- **App-Specific Passwords:** https://appleid.apple.com/account/manage

## ❓ Troubleshooting

### "Invalid Apple ID"
- Make sure you're using your Apple Developer account email
- Check if account is active at https://developer.apple.com

### "2FA Required"
- Generate App-Specific Password
- Use that password instead of your regular password

### "Certificate Expired"
- Run `eas credentials` again
- Expo will regenerate automatically

### "Provisioning Profile Error"
- Run `eas credentials`
- Select "Remove credentials" then "Set up new credentials"

## ✅ Next Steps

1. **Set up credentials:** `eas credentials` → iOS → Set up new
2. **Build iOS:** `eas build --platform ios --profile production`
3. **Or build both:** `eas build --platform all --profile production`

Good luck! 🚀

