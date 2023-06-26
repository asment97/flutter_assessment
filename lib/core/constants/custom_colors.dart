import 'package:flutter/material.dart';

class CustomColors {
  /// Colors from Tailwind CSS
  ///
  /// https://tailwindcss.com/docs/customizing-colors
  static const MaterialColor primarySwatch =
      MaterialColor(0xFF3b82f6, <int, Color>{
    50: Color(0xFFeff6ff),
    100: Color(0xFFdbeafe),
    200: Color(0xFFbfdbfe),
    300: Color(0xFF93c5fd),
    400: Color(0xFF60a5fa),
    500: Color(0xFF3b82f6),
    600: Color(0xFF2563eb),
    700: Color(0xFF1d4ed8),
    800: Color(0xFF1e40af),
    900: Color(0xFF1e3a8a),
  });

  static const Color bgColor = Color(0xFFf3e8ff);
  static const Color primaryColor = Color(0xFF3b82f6);
  static const Color secondaryColor = Color(0xFFa855f7);
}
