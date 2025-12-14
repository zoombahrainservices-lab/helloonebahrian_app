# 📱 Step-by-Step: Build APK After Creating Expo Account

## ✅ Step 1: You've Created Expo Account - Great!

Now let's continue...

---

## 🔧 Step 2: Install EAS CLI

### What is EAS CLI?
EAS (Expo Application Services) CLI is a tool that lets you build your app in the cloud.

### How to Install:

1. **Open PowerShell** (Windows key, type "PowerShell", press Enter)

2. **Navigate to your mobile folder:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```

3. **Install EAS CLI:**
   ```powershell
   npm install -g eas-cli
   ```

4. **Wait for installation** (takes 1-2 minutes)
   - You'll see lots of text scrolling
   - Wait until you see a message like "added 1 package" or similar
   - When you see the command prompt again, it's done!

### Verify Installation:
```powershell
eas --version
```
You should see a version number like `5.2.0` or similar.

---

## 🔐 Step 3: Login to Expo

### In PowerShell (still in mobile folder):

1. **Run login command:**
   ```powershell
   eas login
   ```

2. **You'll see:**
   ```
   ? How would you like to authenticate?
   ❯ Use existing Expo account
     Create new Expo account
   ```

3. **Select "Use existing Expo account"** (press Enter)

4. **Enter your email:**
   ```
   ? Email: your-email@example.com
   ```
   Type your Expo account email and press Enter

5. **Enter your password:**
   ```
   ? Password: ********
   ```
   Type your password (you won't see it, that's normal) and press Enter

6. **Success!** You'll see:
   ```
   ✓ Successfully logged in as your-email@example.com
   ```

---

## ⚙️ Step 4: Configure EAS Build (First Time Only)

### Run this command:
```powershell
eas build:configure
```

### What happens:
1. **It will ask:**
   ```
   ? What would you like to configure?
   ❯ Android
     iOS
     Both
   ```

2. **Select "Android"** (press Enter)

3. **It will ask about build profiles:**
   ```
   ? Which build profile would you like to configure?
   ❯ Production
     Preview
     Development
   ```

4. **Select "Production"** (press Enter)

5. **It will create `eas.json` file** (we already created it, so it might ask to overwrite)
   - If asked, type `y` and press Enter

6. **Done!** You'll see:
   ```
   ✓ Configured eas.json
   ```

---

## 🏗️ Step 5: Start the Build

### Run the build command:
```powershell
eas build --platform android --profile production
```

### What happens next:

1. **First, it will ask about your project:**
   ```
   ? Would you like to create a new project?
   ❯ Yes
     No
   ```
   - Select **"Yes"** (press Enter)

2. **It will ask for project name:**
   ```
   ? What would you like to name your project?
   ```
   - Type: `HelloOne Bahrain` (or press Enter for default)
   - Press Enter

3. **It will ask about app.json:**
   ```
   ? Would you like to use app.json?
   ❯ Yes
     No
   ```
   - Select **"Yes"** (press Enter)

4. **It will ask about credentials:**
   ```
   ? How would you like to upload your credentials?
   ❯ Expo handles all credentials, you can still provide overrides
     I want to upload my own credentials
   ```
   - Select **"Expo handles all credentials"** (press Enter) - This is easier!

5. **Build starts!** You'll see:
   ```
   📦 Starting build...
   🔄 Queued...
   ⏳ Building...
   ```

6. **You'll get a link:**
   ```
   📱 Build details: https://expo.dev/accounts/your-account/projects/hellobahrain-mobile/builds/xxxxx
   ```

---

## ⏳ Step 6: Wait for Build to Complete

### What to expect:

1. **Build takes 10-20 minutes**
   - Don't close PowerShell
   - You can minimize it and do other things

2. **You can check progress:**
   - Click the link shown in PowerShell
   - Or go to: https://expo.dev/accounts
   - Click on your project
   - See build status

3. **Build stages you'll see:**
   - ⏳ Queued (waiting to start)
   - 🔄 Installing dependencies
   - 📦 Building app
   - ✅ Build complete!

4. **You'll get an email** when build is done!

---

## 📥 Step 7: Download Your APK

### When build completes:

1. **Check your email** for "Build finished" notification

2. **Or visit the build link** from Step 5

3. **You'll see:**
   ```
   ✅ Build succeeded!
   📥 Download APK
   ```

4. **Click "Download APK"**
   - File will be named like: `hellobahrain-mobile-1.0.0.apk`
   - Save it somewhere you can find it (like Desktop)

---

## 📱 Step 8: Test Your APK

### Install on your phone:

1. **Transfer APK to your phone:**
   - Email it to yourself
   - Or use USB cable
   - Or upload to Google Drive and download on phone

2. **On your Android phone:**
   - Open the APK file
   - If asked about "Unknown sources", allow it
   - Tap "Install"
   - Wait for installation
   - Tap "Open" to launch app

3. **Test your app:**
   - Make sure everything works
   - Test login, products, cart, checkout
   - If something doesn't work, let me know!

---

## 🎮 Step 9: Upload to Google Play Store

### Create Google Play Console Account:

1. **Go to:** https://play.google.com/console

2. **Click "Get Started"**

3. **Pay $25 registration fee:**
   - One-time payment
   - Use credit/debit card
   - Takes a few minutes

4. **Complete registration:**
   - Fill in your details
   - Accept terms
   - Verify email

### Create Your App:

1. **In Google Play Console, click "Create app"**

2. **Fill in:**
   - **App name:** HelloOne Bahrain
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free
   - Click "Create"

### Upload APK:

1. **Go to "Production" tab** (left sidebar)

2. **Click "Create new release"**

3. **Upload your APK:**
   - Click "Upload" or drag APK file
   - Wait for upload (takes 1-2 minutes)

4. **Add release notes:**
   ```
   Initial release of HelloOne Bahrain mobile app.
   Features:
   - Browse products
   - Add to cart
   - Place orders
   - Track orders
   ```

5. **Click "Save"**

### Complete Store Listing:

1. **Go to "Store presence" → "Main store listing"**

2. **Fill in required fields:**
   - **App name:** HelloOne Bahrain
   - **Short description:** (80 characters max)
     ```
     Shop F1 merchandise, caps, toys, and more from Bahrain's premier store.
     ```
   - **Full description:** (4000 characters max)
     ```
     HelloOne Bahrain is your one-stop shop for F1 merchandise, racing caps, 
     die-cast cars, and exclusive collectibles. Browse our wide selection, 
     add items to cart, and place orders with ease. Track your orders and 
     enjoy fast delivery across Bahrain.
     ```

3. **Upload graphics:**
   - **App icon:** 512x512 PNG (required)
   - **Feature graphic:** 1024x500 PNG (optional but recommended)
   - **Screenshots:** At least 2, max 8
     - Phone: 16:9 or 9:16 ratio
     - Minimum: 320px
     - Recommended: 1080px or higher

4. **Add contact details:**
   - **Email:** Your support email
   - **Phone:** (optional)
   - **Website:** (optional)

5. **Click "Save"**

### Submit for Review:

1. **Go back to "Production" tab**

2. **Review your release:**
   - Make sure everything looks good
   - Check for any warnings (yellow) or errors (red)

3. **Click "Review release"**

4. **If everything is green, click "Start rollout to Production"**

5. **Confirm submission**

6. **Wait for Google review:**
   - Usually takes 1-3 days
   - You'll get email when approved or if changes needed

---

## ✅ Success Checklist

After creating Expo account:
- [ ] Installed EAS CLI (`npm install -g eas-cli`)
- [ ] Logged in to Expo (`eas login`)
- [ ] Configured EAS build (`eas build:configure`)
- [ ] Started build (`eas build --platform android --profile production`)
- [ ] Waited for build to complete (10-20 minutes)
- [ ] Downloaded APK file
- [ ] Tested APK on phone
- [ ] Created Google Play Console account ($25)
- [ ] Created app in Play Console
- [ ] Uploaded APK
- [ ] Completed store listing
- [ ] Submitted for review

---

## 🐛 Common Issues & Solutions

### Issue: "Command not found: eas"
**Solution:**
- Make sure you installed: `npm install -g eas-cli`
- Try: `npx eas-cli login` instead

### Issue: "Not logged in"
**Solution:**
- Run: `eas login` again
- Make sure you created Expo account first

### Issue: "Build failed"
**Solution:**
- Check the error message in build logs
- Make sure all files are saved
- Try: `cd mobile && npm install` first
- Check if you have internet connection

### Issue: "Can't install APK on phone"
**Solution:**
- Go to Settings → Security → Allow "Unknown sources"
- Or Settings → Apps → Special access → Install unknown apps
- Enable for your file manager or browser

---

## 📞 Need Help?

If you get stuck at any step:
1. Check the error message
2. Read the troubleshooting section above
3. Check Expo docs: https://docs.expo.dev/build/introduction/
4. Ask me! I'm here to help! 😊

---

## 🎉 You're Almost There!

Follow these steps one by one, and you'll have your app on Google Play Store soon!

**Good luck!** 🚀


## ✅ Step 1: You've Created Expo Account - Great!

Now let's continue...

---

## 🔧 Step 2: Install EAS CLI

### What is EAS CLI?
EAS (Expo Application Services) CLI is a tool that lets you build your app in the cloud.

### How to Install:

1. **Open PowerShell** (Windows key, type "PowerShell", press Enter)

2. **Navigate to your mobile folder:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```

3. **Install EAS CLI:**
   ```powershell
   npm install -g eas-cli
   ```

4. **Wait for installation** (takes 1-2 minutes)
   - You'll see lots of text scrolling
   - Wait until you see a message like "added 1 package" or similar
   - When you see the command prompt again, it's done!

### Verify Installation:
```powershell
eas --version
```
You should see a version number like `5.2.0` or similar.

---

## 🔐 Step 3: Login to Expo

### In PowerShell (still in mobile folder):

1. **Run login command:**
   ```powershell
   eas login
   ```

2. **You'll see:**
   ```
   ? How would you like to authenticate?
   ❯ Use existing Expo account
     Create new Expo account
   ```

3. **Select "Use existing Expo account"** (press Enter)

4. **Enter your email:**
   ```
   ? Email: your-email@example.com
   ```
   Type your Expo account email and press Enter

5. **Enter your password:**
   ```
   ? Password: ********
   ```
   Type your password (you won't see it, that's normal) and press Enter

6. **Success!** You'll see:
   ```
   ✓ Successfully logged in as your-email@example.com
   ```

---

## ⚙️ Step 4: Configure EAS Build (First Time Only)

### Run this command:
```powershell
eas build:configure
```

### What happens:
1. **It will ask:**
   ```
   ? What would you like to configure?
   ❯ Android
     iOS
     Both
   ```

2. **Select "Android"** (press Enter)

3. **It will ask about build profiles:**
   ```
   ? Which build profile would you like to configure?
   ❯ Production
     Preview
     Development
   ```

4. **Select "Production"** (press Enter)

5. **It will create `eas.json` file** (we already created it, so it might ask to overwrite)
   - If asked, type `y` and press Enter

6. **Done!** You'll see:
   ```
   ✓ Configured eas.json
   ```

---

## 🏗️ Step 5: Start the Build

### Run the build command:
```powershell
eas build --platform android --profile production
```

### What happens next:

1. **First, it will ask about your project:**
   ```
   ? Would you like to create a new project?
   ❯ Yes
     No
   ```
   - Select **"Yes"** (press Enter)

2. **It will ask for project name:**
   ```
   ? What would you like to name your project?
   ```
   - Type: `HelloOne Bahrain` (or press Enter for default)
   - Press Enter

3. **It will ask about app.json:**
   ```
   ? Would you like to use app.json?
   ❯ Yes
     No
   ```
   - Select **"Yes"** (press Enter)

4. **It will ask about credentials:**
   ```
   ? How would you like to upload your credentials?
   ❯ Expo handles all credentials, you can still provide overrides
     I want to upload my own credentials
   ```
   - Select **"Expo handles all credentials"** (press Enter) - This is easier!

5. **Build starts!** You'll see:
   ```
   📦 Starting build...
   🔄 Queued...
   ⏳ Building...
   ```

6. **You'll get a link:**
   ```
   📱 Build details: https://expo.dev/accounts/your-account/projects/hellobahrain-mobile/builds/xxxxx
   ```

---

## ⏳ Step 6: Wait for Build to Complete

### What to expect:

1. **Build takes 10-20 minutes**
   - Don't close PowerShell
   - You can minimize it and do other things

2. **You can check progress:**
   - Click the link shown in PowerShell
   - Or go to: https://expo.dev/accounts
   - Click on your project
   - See build status

3. **Build stages you'll see:**
   - ⏳ Queued (waiting to start)
   - 🔄 Installing dependencies
   - 📦 Building app
   - ✅ Build complete!

4. **You'll get an email** when build is done!

---

## 📥 Step 7: Download Your APK

### When build completes:

1. **Check your email** for "Build finished" notification

2. **Or visit the build link** from Step 5

3. **You'll see:**
   ```
   ✅ Build succeeded!
   📥 Download APK
   ```

4. **Click "Download APK"**
   - File will be named like: `hellobahrain-mobile-1.0.0.apk`
   - Save it somewhere you can find it (like Desktop)

---

## 📱 Step 8: Test Your APK

### Install on your phone:

1. **Transfer APK to your phone:**
   - Email it to yourself
   - Or use USB cable
   - Or upload to Google Drive and download on phone

2. **On your Android phone:**
   - Open the APK file
   - If asked about "Unknown sources", allow it
   - Tap "Install"
   - Wait for installation
   - Tap "Open" to launch app

3. **Test your app:**
   - Make sure everything works
   - Test login, products, cart, checkout
   - If something doesn't work, let me know!

---

## 🎮 Step 9: Upload to Google Play Store

### Create Google Play Console Account:

1. **Go to:** https://play.google.com/console

2. **Click "Get Started"**

3. **Pay $25 registration fee:**
   - One-time payment
   - Use credit/debit card
   - Takes a few minutes

4. **Complete registration:**
   - Fill in your details
   - Accept terms
   - Verify email

### Create Your App:

1. **In Google Play Console, click "Create app"**

2. **Fill in:**
   - **App name:** HelloOne Bahrain
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free
   - Click "Create"

### Upload APK:

1. **Go to "Production" tab** (left sidebar)

2. **Click "Create new release"**

3. **Upload your APK:**
   - Click "Upload" or drag APK file
   - Wait for upload (takes 1-2 minutes)

4. **Add release notes:**
   ```
   Initial release of HelloOne Bahrain mobile app.
   Features:
   - Browse products
   - Add to cart
   - Place orders
   - Track orders
   ```

5. **Click "Save"**

### Complete Store Listing:

1. **Go to "Store presence" → "Main store listing"**

2. **Fill in required fields:**
   - **App name:** HelloOne Bahrain
   - **Short description:** (80 characters max)
     ```
     Shop F1 merchandise, caps, toys, and more from Bahrain's premier store.
     ```
   - **Full description:** (4000 characters max)
     ```
     HelloOne Bahrain is your one-stop shop for F1 merchandise, racing caps, 
     die-cast cars, and exclusive collectibles. Browse our wide selection, 
     add items to cart, and place orders with ease. Track your orders and 
     enjoy fast delivery across Bahrain.
     ```

3. **Upload graphics:**
   - **App icon:** 512x512 PNG (required)
   - **Feature graphic:** 1024x500 PNG (optional but recommended)
   - **Screenshots:** At least 2, max 8
     - Phone: 16:9 or 9:16 ratio
     - Minimum: 320px
     - Recommended: 1080px or higher

4. **Add contact details:**
   - **Email:** Your support email
   - **Phone:** (optional)
   - **Website:** (optional)

5. **Click "Save"**

### Submit for Review:

1. **Go back to "Production" tab**

2. **Review your release:**
   - Make sure everything looks good
   - Check for any warnings (yellow) or errors (red)

3. **Click "Review release"**

4. **If everything is green, click "Start rollout to Production"**

5. **Confirm submission**

6. **Wait for Google review:**
   - Usually takes 1-3 days
   - You'll get email when approved or if changes needed

---

## ✅ Success Checklist

After creating Expo account:
- [ ] Installed EAS CLI (`npm install -g eas-cli`)
- [ ] Logged in to Expo (`eas login`)
- [ ] Configured EAS build (`eas build:configure`)
- [ ] Started build (`eas build --platform android --profile production`)
- [ ] Waited for build to complete (10-20 minutes)
- [ ] Downloaded APK file
- [ ] Tested APK on phone
- [ ] Created Google Play Console account ($25)
- [ ] Created app in Play Console
- [ ] Uploaded APK
- [ ] Completed store listing
- [ ] Submitted for review

---

## 🐛 Common Issues & Solutions

### Issue: "Command not found: eas"
**Solution:**
- Make sure you installed: `npm install -g eas-cli`
- Try: `npx eas-cli login` instead

### Issue: "Not logged in"
**Solution:**
- Run: `eas login` again
- Make sure you created Expo account first

### Issue: "Build failed"
**Solution:**
- Check the error message in build logs
- Make sure all files are saved
- Try: `cd mobile && npm install` first
- Check if you have internet connection

### Issue: "Can't install APK on phone"
**Solution:**
- Go to Settings → Security → Allow "Unknown sources"
- Or Settings → Apps → Special access → Install unknown apps
- Enable for your file manager or browser

---

## 📞 Need Help?

If you get stuck at any step:
1. Check the error message
2. Read the troubleshooting section above
3. Check Expo docs: https://docs.expo.dev/build/introduction/
4. Ask me! I'm here to help! 😊

---

## 🎉 You're Almost There!

Follow these steps one by one, and you'll have your app on Google Play Store soon!

**Good luck!** 🚀


## ✅ Step 1: You've Created Expo Account - Great!

Now let's continue...

---

## 🔧 Step 2: Install EAS CLI

### What is EAS CLI?
EAS (Expo Application Services) CLI is a tool that lets you build your app in the cloud.

### How to Install:

1. **Open PowerShell** (Windows key, type "PowerShell", press Enter)

2. **Navigate to your mobile folder:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```

3. **Install EAS CLI:**
   ```powershell
   npm install -g eas-cli
   ```

4. **Wait for installation** (takes 1-2 minutes)
   - You'll see lots of text scrolling
   - Wait until you see a message like "added 1 package" or similar
   - When you see the command prompt again, it's done!

### Verify Installation:
```powershell
eas --version
```
You should see a version number like `5.2.0` or similar.

---

## 🔐 Step 3: Login to Expo

### In PowerShell (still in mobile folder):

1. **Run login command:**
   ```powershell
   eas login
   ```

2. **You'll see:**
   ```
   ? How would you like to authenticate?
   ❯ Use existing Expo account
     Create new Expo account
   ```

3. **Select "Use existing Expo account"** (press Enter)

4. **Enter your email:**
   ```
   ? Email: your-email@example.com
   ```
   Type your Expo account email and press Enter

5. **Enter your password:**
   ```
   ? Password: ********
   ```
   Type your password (you won't see it, that's normal) and press Enter

6. **Success!** You'll see:
   ```
   ✓ Successfully logged in as your-email@example.com
   ```

---

## ⚙️ Step 4: Configure EAS Build (First Time Only)

### Run this command:
```powershell
eas build:configure
```

### What happens:
1. **It will ask:**
   ```
   ? What would you like to configure?
   ❯ Android
     iOS
     Both
   ```

2. **Select "Android"** (press Enter)

3. **It will ask about build profiles:**
   ```
   ? Which build profile would you like to configure?
   ❯ Production
     Preview
     Development
   ```

4. **Select "Production"** (press Enter)

5. **It will create `eas.json` file** (we already created it, so it might ask to overwrite)
   - If asked, type `y` and press Enter

6. **Done!** You'll see:
   ```
   ✓ Configured eas.json
   ```

---

## 🏗️ Step 5: Start the Build

### Run the build command:
```powershell
eas build --platform android --profile production
```

### What happens next:

1. **First, it will ask about your project:**
   ```
   ? Would you like to create a new project?
   ❯ Yes
     No
   ```
   - Select **"Yes"** (press Enter)

2. **It will ask for project name:**
   ```
   ? What would you like to name your project?
   ```
   - Type: `HelloOne Bahrain` (or press Enter for default)
   - Press Enter

3. **It will ask about app.json:**
   ```
   ? Would you like to use app.json?
   ❯ Yes
     No
   ```
   - Select **"Yes"** (press Enter)

4. **It will ask about credentials:**
   ```
   ? How would you like to upload your credentials?
   ❯ Expo handles all credentials, you can still provide overrides
     I want to upload my own credentials
   ```
   - Select **"Expo handles all credentials"** (press Enter) - This is easier!

5. **Build starts!** You'll see:
   ```
   📦 Starting build...
   🔄 Queued...
   ⏳ Building...
   ```

6. **You'll get a link:**
   ```
   📱 Build details: https://expo.dev/accounts/your-account/projects/hellobahrain-mobile/builds/xxxxx
   ```

---

## ⏳ Step 6: Wait for Build to Complete

### What to expect:

1. **Build takes 10-20 minutes**
   - Don't close PowerShell
   - You can minimize it and do other things

2. **You can check progress:**
   - Click the link shown in PowerShell
   - Or go to: https://expo.dev/accounts
   - Click on your project
   - See build status

3. **Build stages you'll see:**
   - ⏳ Queued (waiting to start)
   - 🔄 Installing dependencies
   - 📦 Building app
   - ✅ Build complete!

4. **You'll get an email** when build is done!

---

## 📥 Step 7: Download Your APK

### When build completes:

1. **Check your email** for "Build finished" notification

2. **Or visit the build link** from Step 5

3. **You'll see:**
   ```
   ✅ Build succeeded!
   📥 Download APK
   ```

4. **Click "Download APK"**
   - File will be named like: `hellobahrain-mobile-1.0.0.apk`
   - Save it somewhere you can find it (like Desktop)

---

## 📱 Step 8: Test Your APK

### Install on your phone:

1. **Transfer APK to your phone:**
   - Email it to yourself
   - Or use USB cable
   - Or upload to Google Drive and download on phone

2. **On your Android phone:**
   - Open the APK file
   - If asked about "Unknown sources", allow it
   - Tap "Install"
   - Wait for installation
   - Tap "Open" to launch app

3. **Test your app:**
   - Make sure everything works
   - Test login, products, cart, checkout
   - If something doesn't work, let me know!

---

## 🎮 Step 9: Upload to Google Play Store

### Create Google Play Console Account:

1. **Go to:** https://play.google.com/console

2. **Click "Get Started"**

3. **Pay $25 registration fee:**
   - One-time payment
   - Use credit/debit card
   - Takes a few minutes

4. **Complete registration:**
   - Fill in your details
   - Accept terms
   - Verify email

### Create Your App:

1. **In Google Play Console, click "Create app"**

2. **Fill in:**
   - **App name:** HelloOne Bahrain
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free
   - Click "Create"

### Upload APK:

1. **Go to "Production" tab** (left sidebar)

2. **Click "Create new release"**

3. **Upload your APK:**
   - Click "Upload" or drag APK file
   - Wait for upload (takes 1-2 minutes)

4. **Add release notes:**
   ```
   Initial release of HelloOne Bahrain mobile app.
   Features:
   - Browse products
   - Add to cart
   - Place orders
   - Track orders
   ```

5. **Click "Save"**

### Complete Store Listing:

1. **Go to "Store presence" → "Main store listing"**

2. **Fill in required fields:**
   - **App name:** HelloOne Bahrain
   - **Short description:** (80 characters max)
     ```
     Shop F1 merchandise, caps, toys, and more from Bahrain's premier store.
     ```
   - **Full description:** (4000 characters max)
     ```
     HelloOne Bahrain is your one-stop shop for F1 merchandise, racing caps, 
     die-cast cars, and exclusive collectibles. Browse our wide selection, 
     add items to cart, and place orders with ease. Track your orders and 
     enjoy fast delivery across Bahrain.
     ```

3. **Upload graphics:**
   - **App icon:** 512x512 PNG (required)
   - **Feature graphic:** 1024x500 PNG (optional but recommended)
   - **Screenshots:** At least 2, max 8
     - Phone: 16:9 or 9:16 ratio
     - Minimum: 320px
     - Recommended: 1080px or higher

4. **Add contact details:**
   - **Email:** Your support email
   - **Phone:** (optional)
   - **Website:** (optional)

5. **Click "Save"**

### Submit for Review:

1. **Go back to "Production" tab**

2. **Review your release:**
   - Make sure everything looks good
   - Check for any warnings (yellow) or errors (red)

3. **Click "Review release"**

4. **If everything is green, click "Start rollout to Production"**

5. **Confirm submission**

6. **Wait for Google review:**
   - Usually takes 1-3 days
   - You'll get email when approved or if changes needed

---

## ✅ Success Checklist

After creating Expo account:
- [ ] Installed EAS CLI (`npm install -g eas-cli`)
- [ ] Logged in to Expo (`eas login`)
- [ ] Configured EAS build (`eas build:configure`)
- [ ] Started build (`eas build --platform android --profile production`)
- [ ] Waited for build to complete (10-20 minutes)
- [ ] Downloaded APK file
- [ ] Tested APK on phone
- [ ] Created Google Play Console account ($25)
- [ ] Created app in Play Console
- [ ] Uploaded APK
- [ ] Completed store listing
- [ ] Submitted for review

---

## 🐛 Common Issues & Solutions

### Issue: "Command not found: eas"
**Solution:**
- Make sure you installed: `npm install -g eas-cli`
- Try: `npx eas-cli login` instead

### Issue: "Not logged in"
**Solution:**
- Run: `eas login` again
- Make sure you created Expo account first

### Issue: "Build failed"
**Solution:**
- Check the error message in build logs
- Make sure all files are saved
- Try: `cd mobile && npm install` first
- Check if you have internet connection

### Issue: "Can't install APK on phone"
**Solution:**
- Go to Settings → Security → Allow "Unknown sources"
- Or Settings → Apps → Special access → Install unknown apps
- Enable for your file manager or browser

---

## 📞 Need Help?

If you get stuck at any step:
1. Check the error message
2. Read the troubleshooting section above
3. Check Expo docs: https://docs.expo.dev/build/introduction/
4. Ask me! I'm here to help! 😊

---

## 🎉 You're Almost There!

Follow these steps one by one, and you'll have your app on Google Play Store soon!

**Good luck!** 🚀


## ✅ Step 1: You've Created Expo Account - Great!

Now let's continue...

---

## 🔧 Step 2: Install EAS CLI

### What is EAS CLI?
EAS (Expo Application Services) CLI is a tool that lets you build your app in the cloud.

### How to Install:

1. **Open PowerShell** (Windows key, type "PowerShell", press Enter)

2. **Navigate to your mobile folder:**
   ```powershell
   cd C:\Users\Farzeen\OneDrive\Desktop\Helloone.app\mobile
   ```

3. **Install EAS CLI:**
   ```powershell
   npm install -g eas-cli
   ```

4. **Wait for installation** (takes 1-2 minutes)
   - You'll see lots of text scrolling
   - Wait until you see a message like "added 1 package" or similar
   - When you see the command prompt again, it's done!

### Verify Installation:
```powershell
eas --version
```
You should see a version number like `5.2.0` or similar.

---

## 🔐 Step 3: Login to Expo

### In PowerShell (still in mobile folder):

1. **Run login command:**
   ```powershell
   eas login
   ```

2. **You'll see:**
   ```
   ? How would you like to authenticate?
   ❯ Use existing Expo account
     Create new Expo account
   ```

3. **Select "Use existing Expo account"** (press Enter)

4. **Enter your email:**
   ```
   ? Email: your-email@example.com
   ```
   Type your Expo account email and press Enter

5. **Enter your password:**
   ```
   ? Password: ********
   ```
   Type your password (you won't see it, that's normal) and press Enter

6. **Success!** You'll see:
   ```
   ✓ Successfully logged in as your-email@example.com
   ```

---

## ⚙️ Step 4: Configure EAS Build (First Time Only)

### Run this command:
```powershell
eas build:configure
```

### What happens:
1. **It will ask:**
   ```
   ? What would you like to configure?
   ❯ Android
     iOS
     Both
   ```

2. **Select "Android"** (press Enter)

3. **It will ask about build profiles:**
   ```
   ? Which build profile would you like to configure?
   ❯ Production
     Preview
     Development
   ```

4. **Select "Production"** (press Enter)

5. **It will create `eas.json` file** (we already created it, so it might ask to overwrite)
   - If asked, type `y` and press Enter

6. **Done!** You'll see:
   ```
   ✓ Configured eas.json
   ```

---

## 🏗️ Step 5: Start the Build

### Run the build command:
```powershell
eas build --platform android --profile production
```

### What happens next:

1. **First, it will ask about your project:**
   ```
   ? Would you like to create a new project?
   ❯ Yes
     No
   ```
   - Select **"Yes"** (press Enter)

2. **It will ask for project name:**
   ```
   ? What would you like to name your project?
   ```
   - Type: `HelloOne Bahrain` (or press Enter for default)
   - Press Enter

3. **It will ask about app.json:**
   ```
   ? Would you like to use app.json?
   ❯ Yes
     No
   ```
   - Select **"Yes"** (press Enter)

4. **It will ask about credentials:**
   ```
   ? How would you like to upload your credentials?
   ❯ Expo handles all credentials, you can still provide overrides
     I want to upload my own credentials
   ```
   - Select **"Expo handles all credentials"** (press Enter) - This is easier!

5. **Build starts!** You'll see:
   ```
   📦 Starting build...
   🔄 Queued...
   ⏳ Building...
   ```

6. **You'll get a link:**
   ```
   📱 Build details: https://expo.dev/accounts/your-account/projects/hellobahrain-mobile/builds/xxxxx
   ```

---

## ⏳ Step 6: Wait for Build to Complete

### What to expect:

1. **Build takes 10-20 minutes**
   - Don't close PowerShell
   - You can minimize it and do other things

2. **You can check progress:**
   - Click the link shown in PowerShell
   - Or go to: https://expo.dev/accounts
   - Click on your project
   - See build status

3. **Build stages you'll see:**
   - ⏳ Queued (waiting to start)
   - 🔄 Installing dependencies
   - 📦 Building app
   - ✅ Build complete!

4. **You'll get an email** when build is done!

---

## 📥 Step 7: Download Your APK

### When build completes:

1. **Check your email** for "Build finished" notification

2. **Or visit the build link** from Step 5

3. **You'll see:**
   ```
   ✅ Build succeeded!
   📥 Download APK
   ```

4. **Click "Download APK"**
   - File will be named like: `hellobahrain-mobile-1.0.0.apk`
   - Save it somewhere you can find it (like Desktop)

---

## 📱 Step 8: Test Your APK

### Install on your phone:

1. **Transfer APK to your phone:**
   - Email it to yourself
   - Or use USB cable
   - Or upload to Google Drive and download on phone

2. **On your Android phone:**
   - Open the APK file
   - If asked about "Unknown sources", allow it
   - Tap "Install"
   - Wait for installation
   - Tap "Open" to launch app

3. **Test your app:**
   - Make sure everything works
   - Test login, products, cart, checkout
   - If something doesn't work, let me know!

---

## 🎮 Step 9: Upload to Google Play Store

### Create Google Play Console Account:

1. **Go to:** https://play.google.com/console

2. **Click "Get Started"**

3. **Pay $25 registration fee:**
   - One-time payment
   - Use credit/debit card
   - Takes a few minutes

4. **Complete registration:**
   - Fill in your details
   - Accept terms
   - Verify email

### Create Your App:

1. **In Google Play Console, click "Create app"**

2. **Fill in:**
   - **App name:** HelloOne Bahrain
   - **Default language:** English
   - **App or game:** App
   - **Free or paid:** Free
   - Click "Create"

### Upload APK:

1. **Go to "Production" tab** (left sidebar)

2. **Click "Create new release"**

3. **Upload your APK:**
   - Click "Upload" or drag APK file
   - Wait for upload (takes 1-2 minutes)

4. **Add release notes:**
   ```
   Initial release of HelloOne Bahrain mobile app.
   Features:
   - Browse products
   - Add to cart
   - Place orders
   - Track orders
   ```

5. **Click "Save"**

### Complete Store Listing:

1. **Go to "Store presence" → "Main store listing"**

2. **Fill in required fields:**
   - **App name:** HelloOne Bahrain
   - **Short description:** (80 characters max)
     ```
     Shop F1 merchandise, caps, toys, and more from Bahrain's premier store.
     ```
   - **Full description:** (4000 characters max)
     ```
     HelloOne Bahrain is your one-stop shop for F1 merchandise, racing caps, 
     die-cast cars, and exclusive collectibles. Browse our wide selection, 
     add items to cart, and place orders with ease. Track your orders and 
     enjoy fast delivery across Bahrain.
     ```

3. **Upload graphics:**
   - **App icon:** 512x512 PNG (required)
   - **Feature graphic:** 1024x500 PNG (optional but recommended)
   - **Screenshots:** At least 2, max 8
     - Phone: 16:9 or 9:16 ratio
     - Minimum: 320px
     - Recommended: 1080px or higher

4. **Add contact details:**
   - **Email:** Your support email
   - **Phone:** (optional)
   - **Website:** (optional)

5. **Click "Save"**

### Submit for Review:

1. **Go back to "Production" tab**

2. **Review your release:**
   - Make sure everything looks good
   - Check for any warnings (yellow) or errors (red)

3. **Click "Review release"**

4. **If everything is green, click "Start rollout to Production"**

5. **Confirm submission**

6. **Wait for Google review:**
   - Usually takes 1-3 days
   - You'll get email when approved or if changes needed

---

## ✅ Success Checklist

After creating Expo account:
- [ ] Installed EAS CLI (`npm install -g eas-cli`)
- [ ] Logged in to Expo (`eas login`)
- [ ] Configured EAS build (`eas build:configure`)
- [ ] Started build (`eas build --platform android --profile production`)
- [ ] Waited for build to complete (10-20 minutes)
- [ ] Downloaded APK file
- [ ] Tested APK on phone
- [ ] Created Google Play Console account ($25)
- [ ] Created app in Play Console
- [ ] Uploaded APK
- [ ] Completed store listing
- [ ] Submitted for review

---

## 🐛 Common Issues & Solutions

### Issue: "Command not found: eas"
**Solution:**
- Make sure you installed: `npm install -g eas-cli`
- Try: `npx eas-cli login` instead

### Issue: "Not logged in"
**Solution:**
- Run: `eas login` again
- Make sure you created Expo account first

### Issue: "Build failed"
**Solution:**
- Check the error message in build logs
- Make sure all files are saved
- Try: `cd mobile && npm install` first
- Check if you have internet connection

### Issue: "Can't install APK on phone"
**Solution:**
- Go to Settings → Security → Allow "Unknown sources"
- Or Settings → Apps → Special access → Install unknown apps
- Enable for your file manager or browser

---

## 📞 Need Help?

If you get stuck at any step:
1. Check the error message
2. Read the troubleshooting section above
3. Check Expo docs: https://docs.expo.dev/build/introduction/
4. Ask me! I'm here to help! 😊

---

## 🎉 You're Almost There!

Follow these steps one by one, and you'll have your app on Google Play Store soon!

**Good luck!** 🚀



