import 'react-native-gesture-handler';
import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { AuthProvider } from './src/contexts/AuthContext';
import { CartProvider } from './src/contexts/CartContext';
import { LanguageProvider } from './src/contexts/LanguageContext';
import AppNavigator from './src/navigation/AppNavigator';
import { View, Text, StyleSheet } from 'react-native';

// Error boundary for better error handling
class ErrorBoundary extends React.Component<
  { children: React.ReactNode },
  { hasError: boolean; error: Error | null }
> {
  constructor(props: { children: React.ReactNode }) {
    super(props);
    this.state = { hasError: false, error: null };
  }

  static getDerivedStateFromError(error: Error) {
    console.error('ErrorBoundary caught error:', error);
    return { hasError: true, error };
  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('App Error:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <View style={styles.errorContainer}>
          <Text style={styles.errorTitle}>Something went wrong</Text>
          <Text style={styles.errorText}>{this.state.error?.message}</Text>
          <Text style={styles.errorHint}>
            Check the browser console (F12) for more details
          </Text>
          <Text style={styles.errorHint}>
            Error: {this.state.error?.stack?.split('\n')[0]}
          </Text>
        </View>
      );
    }

    return this.props.children;
  }
}

export default function App() {
  return (
    <ErrorBoundary>
      <LanguageProvider>
        <AuthProvider>
          <CartProvider>
            <StatusBar style="auto" />
            <AppNavigator />
          </CartProvider>
        </AuthProvider>
      </LanguageProvider>
    </ErrorBoundary>
  );
}

const styles = StyleSheet.create({
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#fff',
  },
  errorTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    color: '#ef4444',
  },
  errorText: {
    fontSize: 16,
    color: '#6b7280',
    marginBottom: 10,
    textAlign: 'center',
  },
  errorHint: {
    fontSize: 14,
    color: '#9ca3af',
    marginTop: 10,
    textAlign: 'center',
  },
});

  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('App Error:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <View style={styles.errorContainer}>
          <Text style={styles.errorTitle}>Something went wrong</Text>
          <Text style={styles.errorText}>{this.state.error?.message}</Text>
          <Text style={styles.errorHint}>
            Check the browser console (F12) for more details
          </Text>
          <Text style={styles.errorHint}>
            Error: {this.state.error?.stack?.split('\n')[0]}
          </Text>
        </View>
      );
    }

    return this.props.children;
  }
}

export default function App() {
  return (
    <ErrorBoundary>
      <LanguageProvider>
        <AuthProvider>
          <CartProvider>
            <StatusBar style="auto" />
            <AppNavigator />
          </CartProvider>
        </AuthProvider>
      </LanguageProvider>
    </ErrorBoundary>
  );
}

const styles = StyleSheet.create({
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#fff',
  },
  errorTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    color: '#ef4444',
  },
  errorText: {
    fontSize: 16,
    color: '#6b7280',
    marginBottom: 10,
    textAlign: 'center',
  },
  errorHint: {
    fontSize: 14,
    color: '#9ca3af',
    marginTop: 10,
    textAlign: 'center',
  },
});

  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('App Error:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <View style={styles.errorContainer}>
          <Text style={styles.errorTitle}>Something went wrong</Text>
          <Text style={styles.errorText}>{this.state.error?.message}</Text>
          <Text style={styles.errorHint}>
            Check the browser console (F12) for more details
          </Text>
          <Text style={styles.errorHint}>
            Error: {this.state.error?.stack?.split('\n')[0]}
          </Text>
        </View>
      );
    }

    return this.props.children;
  }
}

export default function App() {
  return (
    <ErrorBoundary>
      <LanguageProvider>
        <AuthProvider>
          <CartProvider>
            <StatusBar style="auto" />
            <AppNavigator />
          </CartProvider>
        </AuthProvider>
      </LanguageProvider>
    </ErrorBoundary>
  );
}

const styles = StyleSheet.create({
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#fff',
  },
  errorTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    color: '#ef4444',
  },
  errorText: {
    fontSize: 16,
    color: '#6b7280',
    marginBottom: 10,
    textAlign: 'center',
  },
  errorHint: {
    fontSize: 14,
    color: '#9ca3af',
    marginTop: 10,
    textAlign: 'center',
  },
});

  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('App Error:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <View style={styles.errorContainer}>
          <Text style={styles.errorTitle}>Something went wrong</Text>
          <Text style={styles.errorText}>{this.state.error?.message}</Text>
          <Text style={styles.errorHint}>
            Check the browser console (F12) for more details
          </Text>
          <Text style={styles.errorHint}>
            Error: {this.state.error?.stack?.split('\n')[0]}
          </Text>
        </View>
      );
    }

    return this.props.children;
  }
}

export default function App() {
  return (
    <ErrorBoundary>
      <LanguageProvider>
        <AuthProvider>
          <CartProvider>
            <StatusBar style="auto" />
            <AppNavigator />
          </CartProvider>
        </AuthProvider>
      </LanguageProvider>
    </ErrorBoundary>
  );
}

const styles = StyleSheet.create({
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#fff',
  },
  errorTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    color: '#ef4444',
  },
  errorText: {
    fontSize: 16,
    color: '#6b7280',
    marginBottom: 10,
    textAlign: 'center',
  },
  errorHint: {
    fontSize: 14,
    color: '#9ca3af',
    marginTop: 10,
    textAlign: 'center',
  },
});
