// Suppress react-native-web warnings
if (typeof window !== 'undefined') {
  const originalWarn = console.warn;
  console.warn = function(...args) {
    const message = args[0];
    
    // Suppress specific react-native-web warnings
    if (message && typeof message === 'string') {
      // Suppress touch warnings
      if (message.includes('recordTouchEnd') || 
          message.includes('ResponderTouchHistoryStore')) {
        return;
      }
      // Suppress shadow style warnings
      if (message.includes('shadow*') || 
          message.includes('textShadow*') ||
          message.includes('Use "boxShadow"') ||
          message.includes('Use "textShadow"')) {
        return;
      }
      // Suppress pointerEvents warning
      if (message.includes('props.pointerEvents is deprecated')) {
        return;
      }
    }
    
    originalWarn.apply(console, args);
  };
}


  const originalWarn = console.warn;
  console.warn = function(...args) {
    const message = args[0];
    
    // Suppress specific react-native-web warnings
    if (message && typeof message === 'string') {
      // Suppress touch warnings
      if (message.includes('recordTouchEnd') || 
          message.includes('ResponderTouchHistoryStore')) {
        return;
      }
      // Suppress shadow style warnings
      if (message.includes('shadow*') || 
          message.includes('textShadow*') ||
          message.includes('Use "boxShadow"') ||
          message.includes('Use "textShadow"')) {
        return;
      }
      // Suppress pointerEvents warning
      if (message.includes('props.pointerEvents is deprecated')) {
        return;
      }
    }
    
    originalWarn.apply(console, args);
  };
}


  const originalWarn = console.warn;
  console.warn = function(...args) {
    const message = args[0];
    
    // Suppress specific react-native-web warnings
    if (message && typeof message === 'string') {
      // Suppress touch warnings
      if (message.includes('recordTouchEnd') || 
          message.includes('ResponderTouchHistoryStore')) {
        return;
      }
      // Suppress shadow style warnings
      if (message.includes('shadow*') || 
          message.includes('textShadow*') ||
          message.includes('Use "boxShadow"') ||
          message.includes('Use "textShadow"')) {
        return;
      }
      // Suppress pointerEvents warning
      if (message.includes('props.pointerEvents is deprecated')) {
        return;
      }
    }
    
    originalWarn.apply(console, args);
  };
}


  const originalWarn = console.warn;
  console.warn = function(...args) {
    const message = args[0];
    
    // Suppress specific react-native-web warnings
    if (message && typeof message === 'string') {
      // Suppress touch warnings
      if (message.includes('recordTouchEnd') || 
          message.includes('ResponderTouchHistoryStore')) {
        return;
      }
      // Suppress shadow style warnings
      if (message.includes('shadow*') || 
          message.includes('textShadow*') ||
          message.includes('Use "boxShadow"') ||
          message.includes('Use "textShadow"')) {
        return;
      }
      // Suppress pointerEvents warning
      if (message.includes('props.pointerEvents is deprecated')) {
        return;
      }
    }
    
    originalWarn.apply(console, args);
  };
}

