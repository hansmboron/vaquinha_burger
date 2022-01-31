import 'package:flutter/material.dart';

class VaquinaUI {
  VaquinaUI._();

  static const textBold = TextStyle(fontWeight: FontWeight.bold);
  static const primaryColor = Color(0xFF007D21);
  static const primaryColorDark = Color(0xFF00343F);

  static final ThemeData theme = ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    fontFamily: 'mplus1',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        textStyle: const TextStyle(fontFamily: 'mplus1'),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
    ),
  );
}
