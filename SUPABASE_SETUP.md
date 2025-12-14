# 🚀 Direct Supabase Setup - No CORS Issues!

## ✅ Great Idea!

Connecting directly to Supabase bypasses CORS completely and is faster! Here's how to set it up.

## 📋 Step 1: Get Your Supabase Credentials

1. **Go to:** https://app.supabase.com
2. **Select your project**
3. **Go to:** Settings → API
4. **Copy:**
   - **Project URL** → This is your `SUPABASE_URL`
   - **anon/public key** → This is your `SUPABASE_ANON_KEY`

**Important:** Use the **anon/public key**, NOT the service_role key (that's for server-side only).

## 🔧 Step 2: Configure Mobile App

### Option A: Using app.json (Recommended)

Edit `mobile/app.json` and add your credentials:

```json
{
  "expo": {
    "extra": {
      "supabaseUrl": "https://your-project-id.supabase.co",
      "supabaseAnonKey": "your-anon-key-here"
    }
  }
}
```

### Option B: Using Environment Variables

Create `mobile/.env`:

```env
EXPO_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

## ✅ What's Already Done

I've already:
- ✅ Installed `@supabase/supabase-js`
- ✅ Created `mobile/src/lib/supabase.ts` - Supabase client
- ✅ Created `mobile/src/lib/supabase-helpers.ts` - Helper functions
- ✅ Updated `HomeScreen.tsx` - Uses Supabase with API fallback

## 🎯 How It Works

The app now:
1. **Tries Supabase first** - Direct connection, no CORS!
2. **Falls back to API** - If Supabase fails, uses API (for backward compatibility)

## 🚀 Step 3: Test

1. **Add your Supabase credentials** to `app.json` (see Step 2)
2. **Restart Expo:**
   ```powershell
   npm start -- --clear
   ```
3. **Open in browser** (press `w`)
4. **Products should load directly from Supabase!** 🎉

## 📊 Benefits

✅ **No CORS issues** - Direct connection to Supabase
✅ **Faster** - No API middleware
✅ **Real-time** - Can use Supabase real-time features
✅ **Fallback** - Still works with API if Supabase fails

## 🔒 Security Note

The **anon key** is safe to use in client-side code. It's designed for public access with Row Level Security (RLS) policies.

Make sure your Supabase tables have proper RLS policies:
- Products: Public read access
- Categories: Public read access
- Banners: Public read access
- Users: Private (only own data)

## 🐛 Troubleshooting

### Error: "Missing Supabase credentials"
- Make sure you added credentials to `app.json` or `.env`
- Restart Expo after adding credentials

### Error: "Failed to fetch"
- Check your Supabase URL is correct
- Check your anon key is correct
- Check internet connection

### Still seeing CORS errors?
- The app falls back to API if Supabase fails
- Check console for which method is being used
- Supabase should work without CORS issues

## ✅ Status

- ✅ Supabase client created
- ✅ Helper functions created
- ✅ HomeScreen updated
- ⏳ **Need to add your Supabase credentials**

**Add your credentials and test!** 🚀








## ✅ Great Idea!

Connecting directly to Supabase bypasses CORS completely and is faster! Here's how to set it up.

## 📋 Step 1: Get Your Supabase Credentials

1. **Go to:** https://app.supabase.com
2. **Select your project**
3. **Go to:** Settings → API
4. **Copy:**
   - **Project URL** → This is your `SUPABASE_URL`
   - **anon/public key** → This is your `SUPABASE_ANON_KEY`

**Important:** Use the **anon/public key**, NOT the service_role key (that's for server-side only).

## 🔧 Step 2: Configure Mobile App

### Option A: Using app.json (Recommended)

Edit `mobile/app.json` and add your credentials:

```json
{
  "expo": {
    "extra": {
      "supabaseUrl": "https://your-project-id.supabase.co",
      "supabaseAnonKey": "your-anon-key-here"
    }
  }
}
```

### Option B: Using Environment Variables

Create `mobile/.env`:

```env
EXPO_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

## ✅ What's Already Done

I've already:
- ✅ Installed `@supabase/supabase-js`
- ✅ Created `mobile/src/lib/supabase.ts` - Supabase client
- ✅ Created `mobile/src/lib/supabase-helpers.ts` - Helper functions
- ✅ Updated `HomeScreen.tsx` - Uses Supabase with API fallback

## 🎯 How It Works

The app now:
1. **Tries Supabase first** - Direct connection, no CORS!
2. **Falls back to API** - If Supabase fails, uses API (for backward compatibility)

## 🚀 Step 3: Test

1. **Add your Supabase credentials** to `app.json` (see Step 2)
2. **Restart Expo:**
   ```powershell
   npm start -- --clear
   ```
3. **Open in browser** (press `w`)
4. **Products should load directly from Supabase!** 🎉

## 📊 Benefits

✅ **No CORS issues** - Direct connection to Supabase
✅ **Faster** - No API middleware
✅ **Real-time** - Can use Supabase real-time features
✅ **Fallback** - Still works with API if Supabase fails

## 🔒 Security Note

The **anon key** is safe to use in client-side code. It's designed for public access with Row Level Security (RLS) policies.

Make sure your Supabase tables have proper RLS policies:
- Products: Public read access
- Categories: Public read access
- Banners: Public read access
- Users: Private (only own data)

## 🐛 Troubleshooting

### Error: "Missing Supabase credentials"
- Make sure you added credentials to `app.json` or `.env`
- Restart Expo after adding credentials

### Error: "Failed to fetch"
- Check your Supabase URL is correct
- Check your anon key is correct
- Check internet connection

### Still seeing CORS errors?
- The app falls back to API if Supabase fails
- Check console for which method is being used
- Supabase should work without CORS issues

## ✅ Status

- ✅ Supabase client created
- ✅ Helper functions created
- ✅ HomeScreen updated
- ⏳ **Need to add your Supabase credentials**

**Add your credentials and test!** 🚀








## ✅ Great Idea!

Connecting directly to Supabase bypasses CORS completely and is faster! Here's how to set it up.

## 📋 Step 1: Get Your Supabase Credentials

1. **Go to:** https://app.supabase.com
2. **Select your project**
3. **Go to:** Settings → API
4. **Copy:**
   - **Project URL** → This is your `SUPABASE_URL`
   - **anon/public key** → This is your `SUPABASE_ANON_KEY`

**Important:** Use the **anon/public key**, NOT the service_role key (that's for server-side only).

## 🔧 Step 2: Configure Mobile App

### Option A: Using app.json (Recommended)

Edit `mobile/app.json` and add your credentials:

```json
{
  "expo": {
    "extra": {
      "supabaseUrl": "https://your-project-id.supabase.co",
      "supabaseAnonKey": "your-anon-key-here"
    }
  }
}
```

### Option B: Using Environment Variables

Create `mobile/.env`:

```env
EXPO_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

## ✅ What's Already Done

I've already:
- ✅ Installed `@supabase/supabase-js`
- ✅ Created `mobile/src/lib/supabase.ts` - Supabase client
- ✅ Created `mobile/src/lib/supabase-helpers.ts` - Helper functions
- ✅ Updated `HomeScreen.tsx` - Uses Supabase with API fallback

## 🎯 How It Works

The app now:
1. **Tries Supabase first** - Direct connection, no CORS!
2. **Falls back to API** - If Supabase fails, uses API (for backward compatibility)

## 🚀 Step 3: Test

1. **Add your Supabase credentials** to `app.json` (see Step 2)
2. **Restart Expo:**
   ```powershell
   npm start -- --clear
   ```
3. **Open in browser** (press `w`)
4. **Products should load directly from Supabase!** 🎉

## 📊 Benefits

✅ **No CORS issues** - Direct connection to Supabase
✅ **Faster** - No API middleware
✅ **Real-time** - Can use Supabase real-time features
✅ **Fallback** - Still works with API if Supabase fails

## 🔒 Security Note

The **anon key** is safe to use in client-side code. It's designed for public access with Row Level Security (RLS) policies.

Make sure your Supabase tables have proper RLS policies:
- Products: Public read access
- Categories: Public read access
- Banners: Public read access
- Users: Private (only own data)

## 🐛 Troubleshooting

### Error: "Missing Supabase credentials"
- Make sure you added credentials to `app.json` or `.env`
- Restart Expo after adding credentials

### Error: "Failed to fetch"
- Check your Supabase URL is correct
- Check your anon key is correct
- Check internet connection

### Still seeing CORS errors?
- The app falls back to API if Supabase fails
- Check console for which method is being used
- Supabase should work without CORS issues

## ✅ Status

- ✅ Supabase client created
- ✅ Helper functions created
- ✅ HomeScreen updated
- ⏳ **Need to add your Supabase credentials**

**Add your credentials and test!** 🚀








## ✅ Great Idea!

Connecting directly to Supabase bypasses CORS completely and is faster! Here's how to set it up.

## 📋 Step 1: Get Your Supabase Credentials

1. **Go to:** https://app.supabase.com
2. **Select your project**
3. **Go to:** Settings → API
4. **Copy:**
   - **Project URL** → This is your `SUPABASE_URL`
   - **anon/public key** → This is your `SUPABASE_ANON_KEY`

**Important:** Use the **anon/public key**, NOT the service_role key (that's for server-side only).

## 🔧 Step 2: Configure Mobile App

### Option A: Using app.json (Recommended)

Edit `mobile/app.json` and add your credentials:

```json
{
  "expo": {
    "extra": {
      "supabaseUrl": "https://your-project-id.supabase.co",
      "supabaseAnonKey": "your-anon-key-here"
    }
  }
}
```

### Option B: Using Environment Variables

Create `mobile/.env`:

```env
EXPO_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

## ✅ What's Already Done

I've already:
- ✅ Installed `@supabase/supabase-js`
- ✅ Created `mobile/src/lib/supabase.ts` - Supabase client
- ✅ Created `mobile/src/lib/supabase-helpers.ts` - Helper functions
- ✅ Updated `HomeScreen.tsx` - Uses Supabase with API fallback

## 🎯 How It Works

The app now:
1. **Tries Supabase first** - Direct connection, no CORS!
2. **Falls back to API** - If Supabase fails, uses API (for backward compatibility)

## 🚀 Step 3: Test

1. **Add your Supabase credentials** to `app.json` (see Step 2)
2. **Restart Expo:**
   ```powershell
   npm start -- --clear
   ```
3. **Open in browser** (press `w`)
4. **Products should load directly from Supabase!** 🎉

## 📊 Benefits

✅ **No CORS issues** - Direct connection to Supabase
✅ **Faster** - No API middleware
✅ **Real-time** - Can use Supabase real-time features
✅ **Fallback** - Still works with API if Supabase fails

## 🔒 Security Note

The **anon key** is safe to use in client-side code. It's designed for public access with Row Level Security (RLS) policies.

Make sure your Supabase tables have proper RLS policies:
- Products: Public read access
- Categories: Public read access
- Banners: Public read access
- Users: Private (only own data)

## 🐛 Troubleshooting

### Error: "Missing Supabase credentials"
- Make sure you added credentials to `app.json` or `.env`
- Restart Expo after adding credentials

### Error: "Failed to fetch"
- Check your Supabase URL is correct
- Check your anon key is correct
- Check internet connection

### Still seeing CORS errors?
- The app falls back to API if Supabase fails
- Check console for which method is being used
- Supabase should work without CORS issues

## ✅ Status

- ✅ Supabase client created
- ✅ Helper functions created
- ✅ HomeScreen updated
- ⏳ **Need to add your Supabase credentials**

**Add your credentials and test!** 🚀









