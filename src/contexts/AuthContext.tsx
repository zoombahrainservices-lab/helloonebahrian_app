import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import Constants from 'expo-constants';
import { getSupabase } from '@/lib/supabase';
import { User } from '@/lib/types';
import api from '@/lib/api';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as AuthSession from 'expo-auth-session';
import * as WebBrowser from 'expo-web-browser';

// Complete auth session for Google OAuth
WebBrowser.maybeCompleteAuthSession();

interface AuthContextType {
  user: User | null;
  loading: boolean;
  login: (identifier: string, password: string) => Promise<void>;
  register: (name: string, email: string, password: string, phone: string) => Promise<void>;
  loginWithGoogle: () => Promise<void>;
  logout: () => Promise<void>;
  fetchMe: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  const fetchMe = async () => {
    try {
      const supabase = getSupabase();
      const { data: { user: authUser }, error } = await supabase.auth.getUser();
      
      if (error || !authUser) {
        setUser(null);
        setLoading(false);
        return;
      }

      // Get user profile from users table
      const { data: profile, error: profileError } = await supabase
        .from('users')
        .select('*')
        .eq('id', authUser.id)
        .single();

      if (profileError || !profile) {
        // If profile doesn't exist, create it from auth user
        const newProfile = {
          id: authUser.id,
          email: authUser.email || '',
          name: authUser.user_metadata?.name || authUser.email?.split('@')[0] || 'User',
          phone: authUser.user_metadata?.phone || '',
          role: 'user',
        };
        setUser(newProfile as User);
      } else {
        // Transform to User type
        setUser({
          _id: profile.id,
          id: profile.id,
          name: profile.name,
          email: profile.email,
          phone: profile.phone,
          role: profile.role || 'user',
        } as User);
      }
    } catch (error: any) {
      console.error('fetchMe failed:', error);
      setUser(null);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchMe();

    // Listen for auth state changes
    const supabase = getSupabase();
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      if (session) {
        fetchMe();
      } else {
        setUser(null);
      }
    });

    return () => {
      subscription.unsubscribe();
    };
  }, []);

  const login = async (identifier: string, password: string) => {
    const supabase = getSupabase();
    const trimmedIdentifier = identifier.trim();
    
    // Validate inputs
    if (!trimmedIdentifier) {
      throw new Error('Email/username is required');
    }
    
    if (!password || password.trim().length === 0) {
      throw new Error('Password is required');
    }

    if (__DEV__) {
      console.log('🔐 Login attempt:', {
        identifier: trimmedIdentifier.substring(0, 10) + '...',
        identifierType: trimmedIdentifier.includes('@') ? 'email' : 'username',
      });
    }

    // Step 1: Convert username to email if needed
    let userEmail = trimmedIdentifier;
    const isEmail = trimmedIdentifier.includes('@');
    
    if (!isEmail) {
      // Look up username in users table to get email
      if (__DEV__) {
        console.log('🔍 Looking up username in users table...');
      }
      const { data: userData } = await supabase
        .from('users')
        .select('email')
        .eq('name', trimmedIdentifier)
        .maybeSingle();
      
      if (userData?.email) {
        userEmail = userData.email;
        if (__DEV__) {
          console.log('✅ Found email for username:', userEmail.substring(0, 5) + '...');
        }
      } else {
        throw new Error('Username not found. Please check your username and try again.');
      }
    }

    // Step 2: Try to sign in with Supabase Auth
    const { data, error } = await supabase.auth.signInWithPassword({
      email: userEmail,
      password: password,
    });

    // Step 3: Handle errors
    if (error) {
      if (__DEV__) {
        console.log('❌ Supabase Auth failed:', {
          errorCode: error.status,
          errorMessage: error.message,
        });
      }

      // If email not confirmed or invalid credentials, check if user exists in users table
      // If they do, use old API login as fallback (works for web users)
      if (error.message?.includes('Email not confirmed') || 
          error.message?.includes('email not confirmed') ||
          error.message?.includes('Invalid login credentials') || 
          error.message?.includes('Invalid') ||
          error.message?.includes('User not found')) {
        
        if (__DEV__) {
          console.log('🔄 Supabase Auth failed. Checking if user exists in users table (web user)...');
        }
        
        // Check if user exists in users table (web users)
        const { data: existingUser } = await supabase
          .from('users')
          .select('email, id, name')
          .eq('email', userEmail)
          .maybeSingle();
        
        if (existingUser) {
          // User exists in users table - this is a web user
          if (__DEV__) {
            console.log('✅ User found in users table (web user). Creating Supabase Auth account...');
          }
          
          // Try to create Supabase Auth account for web user
          try {
            const { data: signUpData, error: signUpError } = await supabase.auth.signUp({
              email: userEmail,
              password: password,
              options: {
                data: {
                  name: existingUser.name,
                },
                emailRedirectTo: undefined,
              },
            });
            
            if (signUpError) {
              if (__DEV__) {
                console.log('⚠️ Supabase Auth signup error:', signUpError.message);
              }
              
              // If account already exists, try to login again
              if (signUpError.message?.includes('already registered') || signUpError.message?.includes('already exists')) {
                const { data: retryData, error: retryError } = await supabase.auth.signInWithPassword({
                  email: userEmail,
                  password: password,
                });
                
                if (!retryError && retryData?.user) {
                  if (__DEV__) {
                    console.log('✅ Login successful (account already existed)');
                  }
                  await fetchMe();
                  return;
                }
              }
              
              // Email confirmation is required - tell user to disable it in Supabase
              throw new Error(
                'Email confirmation is enabled in Supabase. Please go to Supabase Dashboard → Authentication → Providers → Email → Uncheck "Confirm email" → Save. Then try logging in again.'
              );
            }
            
            if (signUpData?.user) {
              if (__DEV__) {
                console.log('✅ Supabase Auth account created. Logging in...');
              }
              
              // Update users table with new auth ID
              await supabase
                .from('users')
                .update({ id: signUpData.user.id })
                .eq('email', userEmail);
              
              // Try to login
              const { data: loginData, error: loginError } = await supabase.auth.signInWithPassword({
                email: userEmail,
                password: password,
              });
              
              if (!loginError && loginData?.user) {
                if (__DEV__) {
                  console.log('✅ Login successful after account creation');
                }
                await fetchMe();
                return;
              } else if (loginError?.message?.includes('Email not confirmed')) {
                throw new Error(
                  'Email confirmation is enabled in Supabase. Please go to Supabase Dashboard → Authentication → Providers → Email → Uncheck "Confirm email" → Save. Then try logging in again.'
                );
              }
            }
          } catch (createError: any) {
            if (__DEV__) {
              console.log('❌ Account creation failed:', createError.message);
            }
            throw createError;
          }
          
          // Fallback: Try old API login (works on native apps, blocked by CORS on web)
          if (__DEV__) {
            console.log('🔄 Trying old API login as fallback...');
          }
          
          try {
            // Try to login with old API (for web users)
            const loginPayload = isEmail
              ? { email: userEmail, password }
              : { username: trimmedIdentifier, password };
            
            const oldApiResponse = await api.post('/api/auth/login', loginPayload);
            
            if (oldApiResponse.data?.token && oldApiResponse.data?.user) {
              // Old API login successful! Store token and set user
              if (__DEV__) {
                console.log('✅ Login successful via old API (web user)');
              }
              
              // Store token for API requests
              await AsyncStorage.setItem('token', oldApiResponse.data.token);
              
              // Set user from API response
              setUser({
                _id: oldApiResponse.data.user._id || oldApiResponse.data.user.id,
                id: oldApiResponse.data.user.id || oldApiResponse.data.user._id,
                name: oldApiResponse.data.user.name,
                email: oldApiResponse.data.user.email,
                phone: oldApiResponse.data.user.phone || '',
                role: oldApiResponse.data.user.role || 'user',
              } as User);
              
              return; // Success via old API, exit early
            }
          } catch (oldApiError: any) {
            // Old API login failed
            if (__DEV__) {
              console.log('❌ Old API login failed:', oldApiError.response?.data || oldApiError.message);
            }
            
            // If it's a CORS error on web, provide helpful message
            if (oldApiError.message?.includes('CORS') || oldApiError.message?.includes('Network Error') || !oldApiError.response) {
              throw new Error('Unable to login via web browser due to CORS. Please use the mobile app (iOS/Android) or deploy the Supabase Edge Function to enable web login.');
            } else {
              // Password is wrong
              throw new Error('Invalid email/username or password. Please check your credentials and try again.');
            }
          }
        } else {
          // User doesn't exist anywhere
          if (error.message?.includes('Email not confirmed')) {
            throw new Error('Please verify your email address before logging in. Check your inbox for a confirmation email and click the link to activate your account.');
          } else {
            throw new Error('No account found with this email. Please register first.');
          }
        }
      } else {
        throw new Error(error.message || 'Login failed. Please check your email/username and password.');
      }
    }

    // Step 4: If login succeeded, fetch user data
    if (data?.user) {
      if (__DEV__) {
        console.log('✅ Login successful');
      }
      await fetchMe();
    } else {
      throw new Error('Login failed. No user data returned.');
    }
  };

  const register = async (name: string, email: string, password: string, phone: string) => {
    const supabase = getSupabase();
    
    // Check if user already exists in users table (from web app)
    const { data: existingUser } = await supabase
      .from('users')
      .select('email, id')
      .eq('email', email)
      .maybeSingle();
    
    if (existingUser) {
      throw new Error('An account with this email already exists. Please login instead.');
    }
    
    // Sign up with Supabase Auth
    const { data: authData, error: authError } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: {
          name,
          phone,
        },
        emailRedirectTo: undefined,
      },
    });

    if (authError) {
      // If email already exists in Supabase Auth
      if (authError.message?.includes('already registered') || authError.message?.includes('already exists')) {
        throw new Error('An account with this email already exists. Please login instead.');
      }
      throw authError;
    }

    if (authData.user) {
      // Create user profile in users table (for web app compatibility)
      const { error: profileError } = await supabase
        .from('users')
        .insert({
          id: authData.user.id,
          email,
          name,
          phone,
          role: 'user',
        });

      if (profileError && __DEV__) {
        console.warn('Profile creation error (may already exist):', profileError);
      }

      // Try to auto-confirm the user
      try {
        await api.post('/api/auth/auto-confirm', { email });
      } catch (e) {
        // Ignore if API not available
      }

      // If email is already confirmed, fetch user data immediately
      if (authData.user.email_confirmed_at) {
        await fetchMe();
      } else {
        // Try to login after a short delay (in case auto-confirm worked)
        setTimeout(async () => {
          try {
            const { data: loginData } = await supabase.auth.signInWithPassword({
              email,
              password,
            });
            if (loginData?.user) {
              await fetchMe();
            }
          } catch (e) {
            // Ignore - user will need to confirm email
          }
        }, 1000);
        
        // Show success message but mention email confirmation
        throw new Error('Registration successful! If email confirmation is required, please check your email. Otherwise, you can login now.');
      }
    } else {
      throw new Error('Registration failed. Please try again.');
    }
  };

  const loginWithGoogle = async () => {
    try {
      const supabase = getSupabase();

      if (__DEV__) {
        console.log('🔐 Starting Google Sign-In...');
        console.log('📋 Config check:', {
          hasExpoConfig: !!Constants.expoConfig,
          hasExtra: !!Constants.expoConfig?.extra,
          extraKeys: Constants.expoConfig?.extra ? Object.keys(Constants.expoConfig.extra) : [],
        });
      }

      // Note: Google OAuth Client ID should be configured in Supabase Dashboard
      // The app doesn't need to pass it directly - Supabase handles the OAuth flow

      // Create redirect URI
      const redirectUri = AuthSession.makeRedirectUri({
        scheme: 'hellobahrain',
        path: 'auth/callback',
      });

      // Get Supabase OAuth URL for Google
      const { data, error } = await supabase.auth.signInWithOAuth({
        provider: 'google',
        options: {
          redirectTo: redirectUri,
          queryParams: {
            access_type: 'offline',
            prompt: 'consent',
          },
        },
      });

      if (error) {
        throw error;
      }

      if (!data?.url) {
        throw new Error('Failed to get Google OAuth URL');
      }

      // Open browser for OAuth
      const result = await WebBrowser.openAuthSessionAsync(
        data.url,
        redirectUri
      );

      if (result.type === 'success') {
        // Extract tokens from URL
        const url = new URL(result.url);
        const accessToken = url.searchParams.get('access_token');
        const refreshToken = url.searchParams.get('refresh_token');

        if (accessToken) {
          // Set session with tokens
          const { data: sessionData, error: sessionError } = await supabase.auth.setSession({
            access_token: accessToken,
            refresh_token: refreshToken || '',
          });

          if (sessionError) {
            throw sessionError;
          }

          if (sessionData?.user) {
            if (__DEV__) {
              console.log('✅ Google Sign-In successful');
            }

            // Check if user profile exists in users table
            const { data: profile } = await supabase
              .from('users')
              .select('*')
              .eq('id', sessionData.user.id)
              .maybeSingle();

            if (!profile) {
              // Create user profile
              const { error: profileError } = await supabase
                .from('users')
                .insert({
                  id: sessionData.user.id,
                  email: sessionData.user.email || '',
                  name: sessionData.user.user_metadata?.full_name || sessionData.user.user_metadata?.name || sessionData.user.email?.split('@')[0] || 'User',
                  phone: sessionData.user.user_metadata?.phone || '',
                  role: 'user',
                });

              if (profileError && __DEV__) {
                console.warn('Profile creation error:', profileError);
              }
            }

            await fetchMe();
          }
        }
      } else if (result.type === 'cancel') {
        if (__DEV__) {
          console.log('❌ Google Sign-In cancelled');
        }
        throw new Error('Google Sign-In was cancelled');
      } else {
        throw new Error('Google Sign-In failed');
      }
    } catch (error: any) {
      if (__DEV__) {
        console.error('❌ Google Sign-In error:', error);
      }
      throw new Error(error?.message || 'Google Sign-In failed. Please try again.');
    }
  };

  const logout = async () => {
    try {
      const supabase = getSupabase();
      
      // Sign out from Supabase Auth
      await supabase.auth.signOut();
      
      // Clear any stored tokens (for old API login)
      await AsyncStorage.removeItem('token');
      
      // Clear user state
      setUser(null);
      
      if (__DEV__) {
        console.log('✅ Logout successful');
      }
    } catch (error: any) {
      if (__DEV__) {
        console.error('❌ Logout error:', error);
      }
      // Still clear user state even if there's an error
      setUser(null);
      await AsyncStorage.removeItem('token');
    }
  };

  return (
    <AuthContext.Provider value={{ user, loading, login, register, loginWithGoogle, logout, fetchMe }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};



