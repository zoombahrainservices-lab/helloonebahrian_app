import { registerRootComponent } from 'expo';
import App from './App';

// Standard Expo entry point – this lets Metro resolve the app from the project root.
registerRootComponent(App);

// Suppress react-native-web warnings
import './suppress-warnings';

import { registerRootComponent } from 'expo';
import App from './App';

// Register the main component
registerRootComponent(App);
