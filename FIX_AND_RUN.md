# Fix and Run Guide

## Step-by-Step Fix

### Step 1: Clean Install (Run this first!)

```bash
# Delete node_modules and lock file
Remove-Item -Recurse -Force node_modules
Remove-Item -Force package-lock.json

# Reinstall everything
npm install
```

### Step 2: Clear All Caches

```bash
# Clear Expo cache
npx expo start -c
```

### Step 3: Try Starting Again

```bash
npm start
```

## If Still Not Working

### Option A: Reset Everything

```bash
# Delete everything except source code
Remove-Item -Recurse -Force node_modules
Remove-Item -Recurse -Force .expo
Remove-Item -Force package-lock.json

# Reinstall
npm install

# Start with cleared cache
npx expo start -c
```

### Option B: Check for Specific Errors

**If you see "Cannot find module '@/..." errors:**
```bash
npm install babel-plugin-module-resolver --save-dev
```

**If you see "Port 8081 in use" errors:**
```bash
# Windows - Find and kill process
netstat -ano | findstr :8081
# Then kill the PID shown
taskkill /PID <PID_NUMBER> /F
```

**If you see "Expo CLI not found":**
```bash
npm install -g expo-cli
# Or use npx
npx expo start
```

## Common Error Messages and Fixes

### Error: "Unable to resolve module"
**Fix:** Run `npm install` again

### Error: "Babel plugin not found"
**Fix:** `npm install babel-plugin-module-resolver --save-dev`

### Error: "Metro bundler failed"
**Fix:** `npx expo start -c` (clear cache)

### Error: "TypeScript errors"
**Fix:** Check that `expo-env.d.ts` exists in root

### Error: "Cannot find App.tsx"
**Fix:** Make sure you're in the `mobile` directory

## Quick Test

After fixing, test with:
```bash
npm start
```

Then press:
- `w` for web (easiest to test)
- `i` for iOS simulator
- `a` for Android emulator
- Scan QR code for physical device

## Still Having Issues?

**Please share:**
1. The exact error message from terminal
2. What command you ran
3. Your Node.js version (`node -v`)
4. Your npm version (`npm -v`)

This will help identify the specific issue!



