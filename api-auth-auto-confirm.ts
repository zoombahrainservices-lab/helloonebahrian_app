/**
 * Auto-Confirm User API Endpoint
 * 
 * This endpoint automatically confirms users' emails in Supabase Auth
 * when they try to login. This solves the email confirmation requirement issue.
 * 
 * DEPLOYMENT:
 * - For Next.js: Place in client/pages/api/auth/auto-confirm.ts
 * - For Vercel Serverless: Create as api/auth/auto-confirm.ts
 * - For Express: Add as route handler
 */

import { createClient } from '@supabase/supabase-js';

// Initialize Supabase Admin Client (uses service role key)
const supabaseAdmin = createClient(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY! // ⚠️ Server-side only - never expose in client!
);

// For Next.js Pages Router
export default async function handler(req: any, res: any) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { email } = req.body;

  if (!email || typeof email !== 'string') {
    return res.status(400).json({ error: 'Valid email is required' });
  }

  try {
    // Find user by email using Admin API
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
      {
        email_confirm: true, // This confirms the email
      }
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

// For Next.js App Router (uncomment if using App Router)
/*
import { NextRequest, NextResponse } from 'next/server';

export async function POST(request: NextRequest) {
  try {
    const { email } = await request.json();

    if (!email || typeof email !== 'string') {
      return NextResponse.json(
        { error: 'Valid email is required' },
        { status: 400 }
      );
    }

    // Find user by email
    const { data: { users }, error: listError } = await supabaseAdmin.auth.admin.listUsers();
    
    if (listError) {
      return NextResponse.json(
        { error: 'Failed to find user' },
        { status: 500 }
      );
    }

    const user = users.find(u => u.email?.toLowerCase() === email.toLowerCase());

    if (!user) {
      return NextResponse.json(
        { error: 'User not found' },
        { status: 404 }
      );
    }

    // Check if already confirmed
    if (user.email_confirmed_at) {
      return NextResponse.json({
        success: true,
        message: 'User already confirmed',
        already_confirmed: true
      });
    }

    // Auto-confirm the user
    const { data: updatedUser, error: updateError } = await supabaseAdmin.auth.admin.updateUserById(
      user.id,
      {
        email_confirm: true,
      }
    );

    if (updateError) {
      return NextResponse.json(
        { error: updateError.message },
        { status: 500 }
      );
    }

    return NextResponse.json({
      success: true,
      message: 'User confirmed successfully',
    });
  } catch (error: any) {
    return NextResponse.json(
      { error: error.message || 'Internal server error' },
      { status: 500 }
    );
  }
}
*/





