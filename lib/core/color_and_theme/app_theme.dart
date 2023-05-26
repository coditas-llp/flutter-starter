import 'package:flutter/material.dart';

ThemeData appTheme2 = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

ThemeData get appTheme => ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blueAccent,
      onPrimary: Colors.white,
      secondary: Colors.deepOrangeAccent,
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.grey,
      surface: Colors.white,
      onSurface: Colors.grey,
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(),
        textStyle: TextStyle(color: Colors.black),
        menuStyle: MenuStyle()),
    chipTheme: const ChipThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
// elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
// primary: color,
      minimumSize: const Size(100, 32),
// shape: RoundedRectangleBorder(
//     side: const BorderSide(),
//     borderRadius: BorderRadius.circular(24.0)),
    )),
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle()),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.blueAccent.withAlpha(80), // Colors.grey,
// selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSurface),
// unselectedIconTheme: IconThemeData(color: Colors.grey)
    ));
