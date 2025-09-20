import 'package:flutter/material.dart';


class AppTheme {
  //! tema oscuro
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 215, 29, 197),
        brightness: Brightness.dark, // Tema claro
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 129, 16, 182),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 32, 31, 32),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
        bodyMedium: TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
      ),
    );
  }
}