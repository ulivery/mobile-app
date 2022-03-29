import 'package:flutter/material.dart';

ColorScheme defaultColorScheme =
    const ColorScheme.light().copyWith(primary: const Color(0xff06323a), secondary: const Color(0xffe3e3e3));

ThemeData defaultTheme =
    ThemeData.light().copyWith(colorScheme: defaultColorScheme, scaffoldBackgroundColor: Colors.white);
