import 'package:flutter/material.dart';
import 'appcolor.dart';
import 'constant.dart';

ThemeData appThemeData = ThemeData(
  primaryColor: AppColors.primaryColorRed,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.dark(
    background: Colors.white,
  ),
  dividerColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColorRed,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: Colors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
  ),
  fontFamily: Constants.fontfamily,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
);
