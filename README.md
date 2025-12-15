# HelloOne Bahrain Mobile App

A React Native + Expo mobile application for the HelloOne Bahrain e-commerce platform. This mobile app provides the same features and functionality as the web application, optimized for iOS and Android devices.

## Features

- 🛍️ **Product Browsing**: Browse products with categories, search, and sorting
- 🛒 **Shopping Cart**: Add items to cart, manage quantities, and checkout
- 💳 **Payment Integration**: Integrated with Eazypay for secure payments
- 👤 **User Authentication**: Login, register, and manage user profile
- 📦 **Order Management**: View order history and order details
- 🎨 **Banner Carousel**: Dynamic promotional banners on homepage
- 🌐 **Multi-language Support**: English and Arabic support
- 📱 **Native Mobile Experience**: Optimized UI/UX for mobile devices

## Tech Stack

- **React Native** + **Expo** (~51.0.0)
- **TypeScript** for type safety
- **React Navigation** for navigation
- **Axios** for API calls
- **AsyncStorage** for local data persistence
- **Expo Image** for optimized image loading

## Prerequisites

- Node.js (>=18.0.0)
- npm or yarn
- Expo CLI (`npm install -g expo-cli`)
- iOS Simulator (for iOS development) or Android Studio (for Android development)
- Expo Go app on your physical device (for testing)

## Installation

1. Navigate to the mobile directory:
```bash
cd mobile
```

2. Install dependencies:
```bash
npm install
```

3. Configure API base URL:
   - Update `mobile/src/lib/api.ts` with your API base URL
   - Or set `EXPO_PUBLIC_API_BASE_URL` environment variable
   - Default: `https://hello-bahrain-e-commerce-client.vercel.app`

## Running the App

### Development Mode

Start the Expo development server:
```bash
npm start
```

This will open the Expo DevTools. You can:
- Press `i` to open iOS simulator
- Press `a` to open Android emulator
- Scan the QR code with Expo Go app on your physical device

### iOS

```bash
npm run ios
```

### Android

```bash
npm run android
```

### Web (for testing)

```bash
npm run web
```

## Project Structure

```
mobile/
├── src/
│   ├── components/          # Reusable components
│   │   ├── ProductCard.tsx
│   │   └── BannerCarousel.tsx
│   ├── contexts/            # React contexts
│   │   ├── AuthContext.tsx
│   │   ├── CartContext.tsx
│   │   └── LanguageContext.tsx
│   ├── lib/                 # Utilities and helpers
│   │   ├── api.ts          # API client configuration
│   │   ├── currency.ts     # Currency formatting
│   │   └── types.ts        # TypeScript types
│   ├── navigation/          # Navigation configuration
│   │   └── AppNavigator.tsx
│   └── screens/             # Screen components
│       ├── HomeScreen.tsx
│       ├── ProductListScreen.tsx
│       ├── ProductDetailScreen.tsx
│       ├── CartScreen.tsx
│       ├── CheckoutScreen.tsx
│       ├── LoginScreen.tsx
│       ├── RegisterScreen.tsx
│       ├── ProfileScreen.tsx
│       ├── OrdersScreen.tsx
│       └── OrderDetailScreen.tsx
├── App.tsx                  # Main app entry point
├── app.json                 # Expo configuration
├── package.json
└── tsconfig.json
```

## API Integration

The mobile app uses the same serverless API endpoints as the web application:

- **Base URL**: Configured in `src/lib/api.ts`
- **Authentication**: JWT tokens stored in AsyncStorage
- **Endpoints**: All endpoints match the web app's API routes

### Key API Endpoints

- `/api/auth/login` - User login
- `/api/auth/register` - User registration
- `/api/auth/me` - Get current user
- `/api/products` - Get products list
- `/api/products/:slug` - Get product details
- `/api/categories` - Get categories
- `/api/banners/active` - Get active banners
- `/api/orders` - Create order
- `/api/orders/my` - Get user orders
- `/api/eazypay/session` - Create payment session

## Environment Configuration

Create a `.env` file in the `mobile` directory (optional):

```env
EXPO_PUBLIC_API_BASE_URL=https://your-api-url.com
```

## Building for Production

### iOS

1. Configure app.json with your bundle identifier
2. Build with EAS Build:
```bash
eas build --platform ios
```

Or use Expo's build service:
```bash
expo build:ios
```

### Android

1. Configure app.json with your package name
2. Build with EAS Build:
```bash
eas build --platform android
```

Or use Expo's build service:
```bash
expo build:android
```

## Deep Linking

The app supports deep linking with the scheme `hellobahrain://`. Configure deep links in `app.json`:

```json
{
  "expo": {
    "scheme": "hellobahrain"
  }
}
```

## Payment Flow

1. User adds items to cart
2. User proceeds to checkout
3. User enters shipping information
4. Order is created via API
5. Payment session is created with Eazypay
6. User is redirected to payment URL (opens in browser)
7. After payment, user returns to app via deep link

## Known Limitations

- Google OAuth: Currently not implemented in mobile (web-only feature)
- Admin Panel: Not included in mobile app (web-only)
- Push Notifications: Not yet configured
- Offline Support: Limited (cart persists, but API calls require internet)

## Troubleshooting

### Common Issues

1. **API Connection Errors**
   - Verify API base URL is correct
   - Check network connectivity
   - Ensure CORS is configured on the backend

2. **Build Errors**
   - Clear cache: `expo start -c`
   - Delete `node_modules` and reinstall
   - Check Expo SDK version compatibility

3. **Navigation Issues**
   - Ensure all screens are properly registered in AppNavigator
   - Check navigation prop types match

## Contributing

1. Follow the existing code style
2. Use TypeScript for all new code
3. Test on both iOS and Android
4. Update documentation for new features

## License

Same as the main project.

## Support

For issues and questions, please refer to the main project repository.



