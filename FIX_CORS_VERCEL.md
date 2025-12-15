# 🔧 Fix CORS Issue in Vercel/Next.js Backend

## ❌ Can't Fix with Environment Variables

**CORS is NOT controlled by environment variables.** It requires code changes in your API routes.

## ✅ Solution: Add CORS Headers to API Routes

You need to modify your Next.js API routes to allow requests from your mobile app.

### Step 1: Find Your API Routes

Your API routes are in one of these locations:
- `client/pages/api/auth/login.ts` (Pages Router)
- `client/app/api/auth/login/route.ts` (App Router)

### Step 2: Add CORS Headers

#### For Pages Router (`pages/api/auth/login.ts`):

```typescript
import type { NextApiRequest, NextApiResponse } from 'next';

// Add CORS headers helper
function addCorsHeaders(res: NextApiResponse) {
  res.setHeader('Access-Control-Allow-Origin', '*'); // Or specific origin
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  return res;
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  // Handle preflight
  if (req.method === 'OPTIONS') {
    return addCorsHeaders(res).status(200).end();
  }

  // Add CORS headers to response
  addCorsHeaders(res);

  // Your existing login logic here...
  // ...
}
```

#### For App Router (`app/api/auth/login/route.ts`):

```typescript
import { NextRequest, NextResponse } from 'next/server';

// CORS headers
const corsHeaders = {
  'Access-Control-Allow-Origin': '*', // Or specific: 'http://localhost:8081'
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
};

export async function OPTIONS() {
  return NextResponse.json({}, { headers: corsHeaders });
}

export async function POST(request: NextRequest) {
  // Your login logic here...
  const data = await request.json();
  // ... process login ...
  
  return NextResponse.json(
    { token: '...', user: {...} },
    { headers: corsHeaders }
  );
}
```

### Step 3: Update All Auth API Routes

You need to add CORS to:
- `/api/auth/login`
- `/api/auth/register` (if exists)
- `/api/auth/auto-confirm` (the new one we need to create)

### Step 4: Deploy to Vercel

1. **Commit changes:**
   ```powershell
   cd client
   git add .
   git commit -m "Add CORS headers for mobile app"
   git push
   ```

2. **Vercel will auto-deploy** (if connected to GitHub)
   - Or deploy manually from Vercel dashboard

3. **Wait 1-2 minutes** for deployment

## 🎯 Alternative: Use Supabase Edge Function (No Backend Changes!)

If you can't access your backend code, use the **Supabase Edge Function** I created:

1. **No backend code changes needed**
2. **Runs on Supabase** (no CORS issues)
3. **Works immediately** after deployment

See: `mobile/SUPABASE_EDGE_FUNCTION_SETUP.md`

## 📋 Quick Checklist

- [ ] Find your API route files (`client/pages/api/` or `client/app/api/`)
- [ ] Add CORS headers to `/api/auth/login`
- [ ] Add CORS headers to other auth routes
- [ ] Create `/api/auth/auto-confirm` endpoint (see `api-auth-auto-confirm.ts`)
- [ ] Deploy to Vercel
- [ ] Test mobile app login

## 🔍 How to Find Your Backend Code

1. **Check if `client/` directory exists** in your project
2. **Or check your GitHub repository** - the backend code should be there
3. **Or check Vercel dashboard** - you can see the deployed files

## ⚡ Quick Fix: Specific Origins

Instead of `*` (all origins), you can allow specific origins:

```typescript
const allowedOrigins = [
  'http://localhost:8081',
  'http://localhost:8082',
  'https://your-production-domain.com',
];

const origin = req.headers.origin || '';
if (allowedOrigins.includes(origin)) {
  res.setHeader('Access-Control-Allow-Origin', origin);
}
```

This is more secure for production!





