/**
 * ============================================
 * COMPLETE CORS FIX FOR NEXT.JS APP ROUTER
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
import { NextResponse } from 'next/server';

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

export function getCorsHeaders(origin?: string | null) {
  // In production, only allow specific origins (more secure)
  // In development, allow localhost origins
  if (isProduction) {
    // Production: Only allow origins from the allowed list
    const requestOrigin = origin || '';
    const allowOrigin = allowedOrigins.includes(requestOrigin) 
      ? requestOrigin 
      : allowedOrigins[0] || '*'; // Fallback to first allowed origin
      
    return {
      'Access-Control-Allow-Origin': allowOrigin,
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Requested-With',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Max-Age': '86400',
    };
  } else {
    // Development: Allow localhost and all origins for easier testing
    const requestOrigin = origin || '*';
    const allowOrigin = allowedOrigins.includes(requestOrigin) 
      ? requestOrigin 
      : '*'; // Allow all in development
      
    return {
      'Access-Control-Allow-Origin': allowOrigin,
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Requested-With',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Max-Age': '86400',
    };
  }
}
*/

// ============================================
// FILE 2: Copy to client/app/api/auth/login/route.ts
// ============================================

/*
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

    // YOUR EXISTING LOGIN LOGIC HERE
    // ... authenticate user ...
    // ... return token and user data ...

    return NextResponse.json(
      {
        token: 'your-token-here',
        user: { // user data }
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
*/

// ============================================
// FILE 3: Copy to client/app/api/auth/auto-confirm/route.ts
// ============================================

/*
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
*/
