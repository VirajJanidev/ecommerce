import 'package:flutter/services.dart';


class Constants {

  static List<TextInputFormatter> nameFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
    LengthLimitingTextInputFormatter(20)
  ];


  static const String fontfamily = "Rubik";
  static String cancel = "Cancel";
  static String apply = "Apply";
  static String enterAmount = "Enter the amount";

}