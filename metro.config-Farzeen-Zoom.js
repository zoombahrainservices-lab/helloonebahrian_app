// Learn more https://docs.expo.io/guides/customizing-metro
const { getDefaultConfig } = require('expo/metro-config');

/** @type {import('expo/metro-config').MetroConfig} */
const config = getDefaultConfig(__dirname);

// Ensure node_modules are excluded from transformation
config.resolver.blockList = [
  // Block any corrupted files
  /.*\/node_modules\/.*\/node_modules\/react-native\/index\.js$/,
];

// Ensure proper source extensions
config.resolver.sourceExts = [...config.resolver.sourceExts, 'tsx', 'ts'];

module.exports = config;

