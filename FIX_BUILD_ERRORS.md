# 🔧 Fix Build Errors - Complete Guide

## ❌ Errors Found

1. **Missing/Invalid Asset Files** - Image files are empty or corrupted
2. **expo-modules-core** - Should not be installed directly
3. **Metro Version Mismatch** - Wrong metro versions for Expo SDK 51

## ✅ Fixes Applied

### 1. Removed expo-modules-core ✅
- Removed from `package.json`
- This package is included in `expo` package, shouldn't be installed separately

### 2. Fixed Metro Versions ✅
- Added correct metro versions to `devDependencies`:
  - `metro@~0.80.8`
  - `metro-config@~0.80.8`
  - `metro-resolver@~0.80.8`

### 3. Fixed Asset References ✅
- Changed `adaptiveIcon.foregroundImage` to use `icon.png` instead of `adaptive-icon.png`
- This ensures the build can find the image file

## 🚀 Next Steps

### Step 1: Install Updated Dependencies

```powershell
cd mobile
npm install
```

This will:
- Remove `expo-modules-core`
- Install correct metro versions
- Update all dependencies

### Step 2: Verify Assets

Make sure these files exist and are valid PNG images:
- `mobile/assets/icon.png` (1024x1024 recommended)
- `mobile/assets/splash.png` (1242x2436 recommended)

If files are missing or corrupted, you can:
1. Create simple placeholder images
2. Or download default Expo assets

### Step 3: Rebuild

```powershell
eas build --platform android --profile production
```

## 📋 Asset Requirements

### Icon (icon.png)
- **Size:** 1024x1024 pixels
- **Format:** PNG
- **Background:** Transparent or solid color
- **Location:** `mobile/assets/icon.png`

### Splash Screen (splash.png)
- **Size:** 1242x2436 pixels (or 2048x2732 for better quality)
- **Format:** PNG
- **Background:** Should match your app theme (#dc2626)
- **Location:** `mobile/assets/splash.png`

### Adaptive Icon (optional)
- Uses `icon.png` as fallback (already configured)
- Can create separate `adaptive-icon.png` later if needed

## 🔍 Verify Fixes

Run expo doctor to check:

```powershell
cd mobile
npx expo doctor
```

Should show fewer errors now!

## ✅ Expected Result

After fixes:
- ✅ No expo-modules-core error
- ✅ No metro version errors
- ✅ Asset errors resolved (if images are valid)
- ✅ Build should proceed successfully

## 🎯 If Assets Are Still Missing

If you get asset errors, create simple placeholder images:

1. **Create icon.png:**
   - 1024x1024 PNG
   - Red background (#dc2626)
   - White text "H1" or your logo

2. **Create splash.png:**
   - 1242x2436 PNG
   - Red background (#dc2626)
   - White "HelloOne Bahrain" text centered

Or use online tools:
- https://www.appicon.co/ (for icons)
- https://www.figma.com/ (for design)

## 🚀 Ready to Build!

After running `npm install`, try building again:

```powershell
cd mobile
npm install
eas build --platform android --profile production
```

Good luck! 🎉


## ❌ Errors Found

1. **Missing/Invalid Asset Files** - Image files are empty or corrupted
2. **expo-modules-core** - Should not be installed directly
3. **Metro Version Mismatch** - Wrong metro versions for Expo SDK 51

## ✅ Fixes Applied

### 1. Removed expo-modules-core ✅
- Removed from `package.json`
- This package is included in `expo` package, shouldn't be installed separately

### 2. Fixed Metro Versions ✅
- Added correct metro versions to `devDependencies`:
  - `metro@~0.80.8`
  - `metro-config@~0.80.8`
  - `metro-resolver@~0.80.8`

### 3. Fixed Asset References ✅
- Changed `adaptiveIcon.foregroundImage` to use `icon.png` instead of `adaptive-icon.png`
- This ensures the build can find the image file

## 🚀 Next Steps

### Step 1: Install Updated Dependencies

```powershell
cd mobile
npm install
```

This will:
- Remove `expo-modules-core`
- Install correct metro versions
- Update all dependencies

### Step 2: Verify Assets

Make sure these files exist and are valid PNG images:
- `mobile/assets/icon.png` (1024x1024 recommended)
- `mobile/assets/splash.png` (1242x2436 recommended)

If files are missing or corrupted, you can:
1. Create simple placeholder images
2. Or download default Expo assets

### Step 3: Rebuild

```powershell
eas build --platform android --profile production
```

## 📋 Asset Requirements

### Icon (icon.png)
- **Size:** 1024x1024 pixels
- **Format:** PNG
- **Background:** Transparent or solid color
- **Location:** `mobile/assets/icon.png`

### Splash Screen (splash.png)
- **Size:** 1242x2436 pixels (or 2048x2732 for better quality)
- **Format:** PNG
- **Background:** Should match your app theme (#dc2626)
- **Location:** `mobile/assets/splash.png`

### Adaptive Icon (optional)
- Uses `icon.png` as fallback (already configured)
- Can create separate `adaptive-icon.png` later if needed

## 🔍 Verify Fixes

Run expo doctor to check:

```powershell
cd mobile
npx expo doctor
```

Should show fewer errors now!

## ✅ Expected Result

After fixes:
- ✅ No expo-modules-core error
- ✅ No metro version errors
- ✅ Asset errors resolved (if images are valid)
- ✅ Build should proceed successfully

## 🎯 If Assets Are Still Missing

If you get asset errors, create simple placeholder images:

1. **Create icon.png:**
   - 1024x1024 PNG
   - Red background (#dc2626)
   - White text "H1" or your logo

2. **Create splash.png:**
   - 1242x2436 PNG
   - Red background (#dc2626)
   - White "HelloOne Bahrain" text centered

Or use online tools:
- https://www.appicon.co/ (for icons)
- https://www.figma.com/ (for design)

## 🚀 Ready to Build!

After running `npm install`, try building again:

```powershell
cd mobile
npm install
eas build --platform android --profile production
```

Good luck! 🎉


## ❌ Errors Found

1. **Missing/Invalid Asset Files** - Image files are empty or corrupted
2. **expo-modules-core** - Should not be installed directly
3. **Metro Version Mismatch** - Wrong metro versions for Expo SDK 51

## ✅ Fixes Applied

### 1. Removed expo-modules-core ✅
- Removed from `package.json`
- This package is included in `expo` package, shouldn't be installed separately

### 2. Fixed Metro Versions ✅
- Added correct metro versions to `devDependencies`:
  - `metro@~0.80.8`
  - `metro-config@~0.80.8`
  - `metro-resolver@~0.80.8`

### 3. Fixed Asset References ✅
- Changed `adaptiveIcon.foregroundImage` to use `icon.png` instead of `adaptive-icon.png`
- This ensures the build can find the image file

## 🚀 Next Steps

### Step 1: Install Updated Dependencies

```powershell
cd mobile
npm install
```

This will:
- Remove `expo-modules-core`
- Install correct metro versions
- Update all dependencies

### Step 2: Verify Assets

Make sure these files exist and are valid PNG images:
- `mobile/assets/icon.png` (1024x1024 recommended)
- `mobile/assets/splash.png` (1242x2436 recommended)

If files are missing or corrupted, you can:
1. Create simple placeholder images
2. Or download default Expo assets

### Step 3: Rebuild

```powershell
eas build --platform android --profile production
```

## 📋 Asset Requirements

### Icon (icon.png)
- **Size:** 1024x1024 pixels
- **Format:** PNG
- **Background:** Transparent or solid color
- **Location:** `mobile/assets/icon.png`

### Splash Screen (splash.png)
- **Size:** 1242x2436 pixels (or 2048x2732 for better quality)
- **Format:** PNG
- **Background:** Should match your app theme (#dc2626)
- **Location:** `mobile/assets/splash.png`

### Adaptive Icon (optional)
- Uses `icon.png` as fallback (already configured)
- Can create separate `adaptive-icon.png` later if needed

## 🔍 Verify Fixes

Run expo doctor to check:

```powershell
cd mobile
npx expo doctor
```

Should show fewer errors now!

## ✅ Expected Result

After fixes:
- ✅ No expo-modules-core error
- ✅ No metro version errors
- ✅ Asset errors resolved (if images are valid)
- ✅ Build should proceed successfully

## 🎯 If Assets Are Still Missing

If you get asset errors, create simple placeholder images:

1. **Create icon.png:**
   - 1024x1024 PNG
   - Red background (#dc2626)
   - White text "H1" or your logo

2. **Create splash.png:**
   - 1242x2436 PNG
   - Red background (#dc2626)
   - White "HelloOne Bahrain" text centered

Or use online tools:
- https://www.appicon.co/ (for icons)
- https://www.figma.com/ (for design)

## 🚀 Ready to Build!

After running `npm install`, try building again:

```powershell
cd mobile
npm install
eas build --platform android --profile production
```

Good luck! 🎉


## ❌ Errors Found

1. **Missing/Invalid Asset Files** - Image files are empty or corrupted
2. **expo-modules-core** - Should not be installed directly
3. **Metro Version Mismatch** - Wrong metro versions for Expo SDK 51

## ✅ Fixes Applied

### 1. Removed expo-modules-core ✅
- Removed from `package.json`
- This package is included in `expo` package, shouldn't be installed separately

### 2. Fixed Metro Versions ✅
- Added correct metro versions to `devDependencies`:
  - `metro@~0.80.8`
  - `metro-config@~0.80.8`
  - `metro-resolver@~0.80.8`

### 3. Fixed Asset References ✅
- Changed `adaptiveIcon.foregroundImage` to use `icon.png` instead of `adaptive-icon.png`
- This ensures the build can find the image file

## 🚀 Next Steps

### Step 1: Install Updated Dependencies

```powershell
cd mobile
npm install
```

This will:
- Remove `expo-modules-core`
- Install correct metro versions
- Update all dependencies

### Step 2: Verify Assets

Make sure these files exist and are valid PNG images:
- `mobile/assets/icon.png` (1024x1024 recommended)
- `mobile/assets/splash.png` (1242x2436 recommended)

If files are missing or corrupted, you can:
1. Create simple placeholder images
2. Or download default Expo assets

### Step 3: Rebuild

```powershell
eas build --platform android --profile production
```

## 📋 Asset Requirements

### Icon (icon.png)
- **Size:** 1024x1024 pixels
- **Format:** PNG
- **Background:** Transparent or solid color
- **Location:** `mobile/assets/icon.png`

### Splash Screen (splash.png)
- **Size:** 1242x2436 pixels (or 2048x2732 for better quality)
- **Format:** PNG
- **Background:** Should match your app theme (#dc2626)
- **Location:** `mobile/assets/splash.png`

### Adaptive Icon (optional)
- Uses `icon.png` as fallback (already configured)
- Can create separate `adaptive-icon.png` later if needed

## 🔍 Verify Fixes

Run expo doctor to check:

```powershell
cd mobile
npx expo doctor
```

Should show fewer errors now!

## ✅ Expected Result

After fixes:
- ✅ No expo-modules-core error
- ✅ No metro version errors
- ✅ Asset errors resolved (if images are valid)
- ✅ Build should proceed successfully

## 🎯 If Assets Are Still Missing

If you get asset errors, create simple placeholder images:

1. **Create icon.png:**
   - 1024x1024 PNG
   - Red background (#dc2626)
   - White text "H1" or your logo

2. **Create splash.png:**
   - 1242x2436 PNG
   - Red background (#dc2626)
   - White "HelloOne Bahrain" text centered

Or use online tools:
- https://www.appicon.co/ (for icons)
- https://www.figma.com/ (for design)

## 🚀 Ready to Build!

After running `npm install`, try building again:

```powershell
cd mobile
npm install
eas build --platform android --profile production
```

Good luck! 🎉



