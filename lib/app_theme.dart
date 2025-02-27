import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff5669FF);
  static const Color backgroundLight = Color(0xffF2FEFF);
  static const Color backgroundDark = Color(0xff101127);
  static const Color whiteColor = Color(0xffF4EBDC);
  static const Color redColor = Color(0xffFF5659);
  static const Color white = Color(0xffffffff);
  static const Color blackColor = Color(0xff1C1C1C);
  static const Color greyColor = Color(0xff7B7B7B);

  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: backgroundLight,
      primaryColor: primary,
      bottomAppBarTheme: BottomAppBarTheme(
        color: primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: white,
          shape: CircleBorder(side: BorderSide(width: 5, color: white))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        selectedItemColor: white,
        unselectedItemColor: white,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: primary,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: backgroundLight,
          foregroundColor: primary,
          titleTextStyle: TextStyle(color: primary, fontSize: 22),
          centerTitle: true),
      textTheme: TextTheme(
        bodyLarge:
            TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            color: primary, fontSize: 16, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            color: greyColor, fontSize: 16, fontWeight: FontWeight.w500),
        displayLarge:
            TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.bold),
        displaySmall:
            TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w400),
        displayMedium: TextStyle(
            color: blackColor, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      datePickerTheme: DatePickerThemeData(
          dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primary;
        }
        return Colors.transparent;
      })),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: BorderRadius.circular(16)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: BorderRadius.circular(16)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: BorderRadius.circular(16))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: white,
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              fixedSize: Size(double.infinity, 56))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: primary,
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline))),
      dividerTheme: DividerThemeData(color: primary, indent: 8, endIndent: 8));

  static ThemeData dark = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: AppBarTheme(
          backgroundColor: backgroundDark,
          foregroundColor: primary,
          centerTitle: true));
}
