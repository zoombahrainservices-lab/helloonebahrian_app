/**
 * ============================================
 * COMPLETE CORS FIX FOR NEXT.JS PAGES ROUTER
 * ============================================
 * 
 * ⚠️ IMPORTANT: This is a TEMPLATE file for your BACKEND
 * 
 * This file contains code examples to COPY to your Next.js backend.
 * DO NOT run this file in the mobile app - it will cause errors!
 * 
 * INSTRUCTIONS:
 * 1. Copy each section to the corresponding file in your backend
 * 2. This file is just a reference/template
 * 3. Delete this file after copying to backend (optional)
 */

// ============================================
// FILE 1: Copy to client/src/lib/cors.ts
// ============================================

/*
import type { NextApiResponse } from 'next';

// Development origins (for local testing)
const devOrigins = [
  'http://localhost:8081',
  'http://localhost:8082',
  'http://localhost:19006',
  'exp://localhost:8081',
];

// Production origins (add your production mobile app domains here)
const prodOrigins = [
  'https://hello-bahrain-e-commerce-client.vercel.app',
  // Add your production mobile app domain here when you deploy
  // Example: 'https://your-mobile-app.vercel.app',
  // Example: 'https://your-mobile-app.expo.dev',
];

// Combine all allowed origins
const allowedOrigins = [
  ...devOrigins,
  ...prodOrigins,
];

// Check if we're in production
const isProduction = process.env.NODE_ENV === 'production';

export function addCorsHeaders(res: NextApiResponse, origin?: string) {
  // In production, only allow specific origins (more secure)
  // In development, allow localhost origins
  if (isProduction) {
    // Production: Only allow origins from the allowed list
    const requestOrigin = origin || '';
    const allowOrigin = allowedOrigins.includes(requestOrigin) 
      ? requestOrigin 
      : allowedOrigins[0] || '*'; // Fallback to first allowed origin
      
    res.setHeader('Access-Control-Allow-Origin', allowOrigin);
  } else {
    // Development: Allow localhost and all origins for easier testing
    const requestOrigin = origin || '*';
    const allowOrigin = allowedOrigins.includes(requestOrigin) 
      ? requestOrigin 
      : '*'; // Allow all in development
      
    res.setHeader('Access-Control-Allow-Origin', allowOrigin);
  }
  
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With');
  res.setHeader('Access-Control-Allow-Credentials', 'true');
  res.setHeader('Access-Control-Max-Age', '86400');
  
  return res;
}

export function handleCorsPreflight(req: any, res: NextApiResponse) {
  if (req.method === 'OPTIONS') {
    return addCorsHeaders(res, req.headers.origin).status(200).end();
  }
}
*/

// ============================================
// FILE 2: Copy to client/pages/api/auth/login.ts
// ============================================

/*
import type { NextApiRequest, NextApiResponse } from 'next';
import { addCorsHeaders, handleCorsPreflight } from '@/lib/cors';

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  // Handle CORS preflight
  handleCorsPreflight(req, res);
  if (req.method === 'OPTIONS') {
    return;
  }

  // Add CORS headers
  addCorsHeaders(res, req.headers.origin);

  try {
    const { email, password, username, identifier } = req.body;

    // YOUR EXISTING LOGIN LOGIC HERE
    // ... authenticate user ...
    // ... return token and user data ...

    return res.status(200).json({
      token: 'your-token-here',
      user: { // user data }
    });
  } catch (error: any) {
    return res.status(500).json({ 
      error: error.message || 'Login failed' 
    });
  }
}
*/

// ============================================
// FILE 3: Copy to client/pages/api/auth/auto-confirm.ts
// ============================================

/*
import type { NextApiRequest, NextApiResponse } from 'next';
import { createClient } from '@supabase/supabase-js';
import { addCorsHeaders, handleCorsPreflight } from '@/lib/cors';

const supabaseAdmin = createClient(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
);

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  // Handle CORS preflight
  handleCorsPreflight(req, res);
  if (req.method === 'OPTIONS') {
    return;
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
*/
