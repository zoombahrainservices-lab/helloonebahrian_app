# 🔧 Complete CORS Fix for Next.js Backend

## ⚠️ Important: CORS is Server-Side, Not Client-Side

**Axios is a client-side library** - it makes HTTP requests. **CORS headers must be set on your backend** (Next.js API routes) to allow those requests.

## 📋 What You Need to Do

### Step 1: Find Your Backend Code

Your backend is a **Next.js app** deployed on Vercel. You need to:

1. **Find your backend repository** (separate from this mobile app)
2. **Locate API routes** in one of these locations:
   - `pages/api/` (Pages Router)
   - `app/api/` (App Router)

### Step 2: Add CORS Headers to ALL API Routes

You need to add CORS headers to:
- ✅ `/api/auth/login` (existing)
- ✅ `/api/auth/auto-confirm` (new - needs to be created)
- ✅ Any other API routes your mobile app uses

---

## 🚀 Solution 1: Pages Router (`pages/api/`)

### A. Create CORS Helper File

**File:** `client/src/lib/cors.ts` (or `client/lib/cors.ts`)

```typescript
import type { NextApiResponse } from 'next';

/**
 * CORS Helper for Next.js Pages Router
 * Add this to all API route responses
 */

// Allowed origins (add your production domains)
const allowedOrigins = [
  'http://localhost:8081',
  'http://localhost:8082',
  'http://localhost:19006',
  'exp://localhost:8081',
  'https://hello-bahrain-e-commerce-client.vercel.app',
  // Add your production mobile app domain here
];

export function addCorsHeaders(res: NextApiResponse, origin?: string) {
  const requestOrigin = origin || '*';
  const allowOrigin = allowedOrigins.includes(requestOrigin) 
    ? requestOrigin 
    : '*'; // Allow all in development, restrict in production

  res.setHeader('Access-Control-Allow-Origin', allowOrigin);
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With');
  res.setHeader('Access-Control-Allow-Credentials', 'true');
  res.setHeader('Access-Control-Max-Age', '86400'); // 24 hours
  
  return res;
}

export function handleCorsPreflight(req: any, res: NextApiResponse) {
  if (req.method === 'OPTIONS') {
    return addCorsHeaders(res, req.headers.origin).status(200).end();
  }
}
```

### B. Update Existing `/api/auth/login` Route

**File:** `client/pages/api/auth/login.ts`

```typescript
import type { NextApiRequest, NextApiResponse } from 'next';
import { addCorsHeaders, handleCorsPreflight } from '@/lib/cors'; // Adjust import path

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  // Handle CORS preflight
  handleCorsPreflight(req, res);
  if (req.method === 'OPTIONS') {
    return; // Already handled
  }

  // Add CORS headers to all responses
  addCorsHeaders(res, req.headers.origin);

  try {
    const { email, password, username, identifier } = req.body;

    // Your existing login logic here...
    // ... authenticate user ...
    // ... return token and user data ...

    return res.status(200).json({
      token: 'your-token',
      user: { /* user data */ }
    });
  } catch (error: any) {
    return res.status(500).json({ 
      error: error.message || 'Login failed' 
    });
  }
}
```

### C. Create `/api/auth/auto-confirm` Route

**File:** `client/pages/api/auth/auto-confirm.ts`

```typescript
import type { NextApiRequest, NextApiResponse } from 'next';
import { createClient } from '@supabase/supabase-js';
import { addCorsHeaders, handleCorsPreflight } from '@/lib/cors';

// Initialize Supabase Admin Client
const supabaseAdmin = createClient(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY! // ⚠️ Server-side only!
);

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  // Handle CORS preflight
  handleCorsPreflight(req, res);
  if (req.method === 'OPTIONS') {
    return; // Already handled
  }

  // Add CORS headers
  addCorsHeaders(res, req.headers.origin);

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { email } = req.body;

  if (!email || typeof email !== 'string') {
    return res.status(400).json({ error: 'Valid email is required' });
  }

  try {
    // Find user by email
    const { data: { users }, error: listError } = await supabaseAdmin.auth.admin.listUsers();
    
    if (listError) {
      console.error('Error listing users:', listError);
      return res.status(500).json({ error: 'Failed to find user' });
    }

    const user = users.find(u => u.email?.toLowerCase() === email.toLowerCase());

    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }

    // Check if already confirmed
    if (user.email_confirmed_at) {
      return res.status(200).json({ 
        success: true, 
        message: 'User already confirmed',
        already_confirmed: true
      });
    }

    // Auto-confirm the user
    const { data: updatedUser, error: updateError } = await supabaseAdmin.auth.admin.updateUserById(
      user.id,
      { email_confirm: true }
    );

    if (updateError) {
      console.error('Error confirming user:', updateError);
      return res.status(500).json({ error: updateError.message });
    }

    return res.status(200).json({ 
      success: true, 
      message: 'User confirmed successfully',
      user: {
        id: updatedUser.user.id,
        email: updatedUser.user.email,
        email_confirmed_at: updatedUser.user.email_confirmed_at,
      }
    });
  } catch (error: any) {
    console.error('Unexpected error:', error);
    return res.status(500).json({ error: error.message || 'Internal server error' });
  }
}
```

---

## 🚀 Solution 2: App Router (`app/api/`)

### A. Create CORS Helper

**File:** `client/src/lib/cors.ts`

```typescript
import { NextResponse } from 'next/server';

const allowedOrigins = [
  'http://localhost:8081',
  'http://localhost:8082',
  'http://localhost:19006',
  'exp://localhost:8081',
  'https://hello-bahrain-e-commerce-client.vercel.app',
];

export function getCorsHeaders(origin?: string | null) {
  const requestOrigin = origin || '*';
  const allowOrigin = allowedOrigins.includes(requestOrigin) 
    ? requestOrigin 
    : '*';

  return {
    'Access-Control-Allow-Origin': allowOrigin,
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Requested-With',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Max-Age': '86400',
  };
}
```

### B. Update `/api/auth/login` Route

**File:** `client/app/api/auth/login/route.ts`

```typescript
import { NextRequest, NextResponse } from 'next/server';
import { getCorsHeaders } from '@/lib/cors';

// Handle OPTIONS (preflight)
export async function OPTIONS(request: NextRequest) {
  const origin = request.headers.get('origin');
  return NextResponse.json({}, { headers: getCorsHeaders(origin) });
}

// Handle POST
export async function POST(request: NextRequest) {
  const origin = request.headers.get('origin');
  const corsHeaders = getCorsHeaders(origin);

  try {
    const body = await request.json();
    const { email, password, username, identifier } = body;

    // Your existing login logic here...
    // ... authenticate user ...

    return NextResponse.json(
      {
        token: 'your-token',
        user: { /* user data */ }
      },
      { headers: corsHeaders }
    );
  } catch (error: any) {
    return NextResponse.json(
      { error: error.message || 'Login failed' },
      { status: 500, headers: corsHeaders }
    );
  }
}
```

### C. Create `/api/auth/auto-confirm` Route

**File:** `client/app/api/auth/auto-confirm/route.ts`

```typescript
import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';
import { getCorsHeaders } from '@/lib/cors';

const supabaseAdmin = createClient(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
);

export async function OPTIONS(request: NextRequest) {
  const origin = request.headers.get('origin');
  return NextResponse.json({}, { headers: getCorsHeaders(origin) });
}

export async function POST(request: NextRequest) {
  const origin = request.headers.get('origin');
  const corsHeaders = getCorsHeaders(origin);

  try {
    const { email } = await request.json();

    if (!email || typeof email !== 'string') {
      return NextResponse.json(
        { error: 'Valid email is required' },
        { status: 400, headers: corsHeaders }
      );
    }

    // Find user by email
    const { data: { users }, error: listError } = await supabaseAdmin.auth.admin.listUsers();
    
    if (listError) {
      return NextResponse.json(
        { error: 'Failed to find user' },
        { status: 500, headers: corsHeaders }
      );
    }

    const user = users.find(u => u.email?.toLowerCase() === email.toLowerCase());

    if (!user) {
      return NextResponse.json(
        { error: 'User not found' },
        { status: 404, headers: corsHeaders }
      );
    }

    if (user.email_confirmed_at) {
      return NextResponse.json({
        success: true,
        message: 'User already confirmed',
        already_confirmed: true
      }, { headers: corsHeaders });
    }

    // Auto-confirm the user
    const { data: updatedUser, error: updateError } = await supabaseAdmin.auth.admin.updateUserById(
      user.id,
      { email_confirm: true }
    );

    if (updateError) {
      return NextResponse.json(
        { error: updateError.message },
        { status: 500, headers: corsHeaders }
      );
    }

    return NextResponse.json({
      success: true,
      message: 'User confirmed successfully',
      user: {
        id: updatedUser.user.id,
        email: updatedUser.user.email,
        email_confirmed_at: updatedUser.user.email_confirmed_at,
      }
    }, { headers: corsHeaders });
  } catch (error: any) {
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500, headers: corsHeaders }
    );
  }
}
```

---

## 🔐 Step 3: Add Environment Variables to Vercel

1. **Go to Vercel Dashboard** → Your Project → Settings → Environment Variables
2. **Add these variables:**
   - `SUPABASE_URL` = Your Supabase project URL
   - `SUPABASE_SERVICE_ROLE_KEY` = Your Supabase service role key (from Supabase dashboard → Settings → API)

---

## 📦 Step 4: Install Dependencies (if needed)

In your backend directory:

```bash
npm install @supabase/supabase-js
```

---

## 🚀 Step 5: Deploy to Vercel

1. **Commit changes:**
   ```bash
   git add .
   git commit -m "Add CORS headers for mobile app"
   git push
   ```

2. **Vercel will auto-deploy** (if connected to GitHub)
   - Or deploy manually from Vercel dashboard

3. **Wait 1-2 minutes** for deployment

---

## ✅ Step 6: Test

1. **Restart your mobile app:**
   ```powershell
   cd mobile
   npm start -- --clear
   ```

2. **Try logging in** - CORS errors should be gone!

---

## 📝 Quick Checklist

- [ ] Find your backend repository
- [ ] Determine if using Pages Router or App Router
- [ ] Create CORS helper file
- [ ] Update `/api/auth/login` with CORS headers
- [ ] Create `/api/auth/auto-confirm` with CORS headers
- [ ] Add environment variables to Vercel
- [ ] Deploy to Vercel
- [ ] Test mobile app login

---

## 🎯 What This Does

1. **CORS Headers**: Allows your mobile app (axios requests) to access the API
2. **OPTIONS Handler**: Handles preflight requests from browsers
3. **Auto-Confirm**: Automatically confirms user emails in Supabase
4. **Works with Axios**: Your existing axios setup will work without changes

---

## 🔍 How to Find Your Backend Code

1. **Check GitHub** - Look for the repository that contains your Next.js app
2. **Check Vercel Dashboard** - See which repository is connected
3. **Look for `package.json`** with Next.js dependencies
4. **Check for `pages/` or `app/` directories**

---

## ⚠️ Important Notes

- **CORS is server-side only** - Axios doesn't handle CORS
- **Environment variables** must be set in Vercel, not just locally
- **Service Role Key** is secret - never expose in client code
- **Test after deployment** - CORS only works when deployed

---

**After deploying, your axios requests will work!** 🎉





