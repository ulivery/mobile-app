import 'package:flutter/material.dart';

ColorScheme defaultColorScheme = const ColorScheme.light().copyWith(
    primary: const Color(0xff06323a),
    secondary: const Color(0xfff6f6f6),
    secondaryContainer: const Color(0xffe8e8e8));

ThemeData defaultTheme = ThemeData.light().copyWith(
    colorScheme: defaultColorScheme, scaffoldBackgroundColor: Colors.white);
