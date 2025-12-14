# Troubleshooting Guide

## Common Startup Issues

### 1. "Cannot find module" errors

**Solution:**
```bash
# Delete node_modules and reinstall
rm -rf node_modules
npm install
```

### 2. "Babel plugin not found" errors

**Solution:**
```bash
npm install babel-plugin-module-resolver --save-dev
```

### 3. "Metro bundler" connection issues

**Solution:**
```bash
# Clear cache and restart
expo start -c
# or
npm start -- --clear
```

### 4. "Module resolution" errors with @ alias

**Check:**
- `babel.config.js` has module-resolver plugin configured
- `tsconfig.json` has paths configured
- Run: `npm install babel-plugin-module-resolver --save-dev`

### 5. "Expo CLI not found"

**Solution:**
```bash
npm install -g expo-cli
# or use npx
npx expo start
```

### 6. Port 8081 already in use

**Solution:**
```bash
# Kill process on port 8081 (Windows)
netstat -ano | findstr :8081
taskkill /PID <PID> /F

# Or use different port
expo start --port 8082
```

### 7. TypeScript errors

**Solution:**
```bash
# Check tsconfig.json is correct
# Make sure expo-env.d.ts exists
```

### 8. Missing assets (icon.png, splash.png)

**Solution:**
- Create `assets` folder
- Add placeholder images (or use Expo's default)
- App will work without them, but you'll see warnings

### 9. "Unable to resolve module" errors

**Solution:**
```bash
# Clear watchman cache (if installed)
watchman watch-del-all

# Clear Metro bundler cache
expo start -c

# Reset Metro bundler
npm start -- --reset-cache
```

### 10. React Native version mismatch

**Solution:**
```bash
# Check package.json versions match Expo SDK
# For Expo 51, use React Native 0.74.0
```

## Quick Fix Commands

Run these in order if you're having issues:

```bash
# 1. Clean install
rm -rf node_modules package-lock.json
npm install

# 2. Clear all caches
expo start -c

# 3. If still not working, reset everything
rm -rf node_modules .expo
npm install
expo start -c
```

## Getting Help

If you're still having issues:

1. Check the exact error message in the terminal
2. Look for the error in Expo documentation
3. Check React Native troubleshooting guide
4. Verify all dependencies are installed correctly



