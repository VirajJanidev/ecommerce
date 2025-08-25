import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();

  static const Color primaryColorYellow = Color(0xffFFF700);
  static const Color primaryColorRed = Color(0xffF53C3C);
  static const Color textColor = Color(0xff000000);
    static const Color liteOrange = Color(0xffFF9666);
  static const Color tabBg = Color(0xffdee4e3);
  static const Color red = Color(0xFFFF0000);
  static const Color darkGreen = Color(0xFF446650);
  static const Color redDark = Color(0xFF841617);
  static const Color redLite = Color(0xFF841617);
  static const Color buttonColor = Color(0xFF789292);
    static const Color gray = Color(0xFF9E9E9E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color shadowRed = Color(0xFFF67676);
  static const Color orange = Color(0xFFFFA451);

  static LinearGradient gradient = const LinearGradient(colors: <Color>[
    AppColors.gray,
  ], begin: Alignment.center, end: Alignment.topRight);

  static Gradient horizontalLinear = const LinearGradient(
    begin: Alignment(-0.9, 1.0),
    end: Alignment(0.4, 1.0),
    colors: [
      shadowRed,
      white,
    ],
  );

}
