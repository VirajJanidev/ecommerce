import 'package:flutter/material.dart';

enum AppFontFamily {
  rubik,
  poppins,
  lato,
}

extension AppFontFamilyExt on AppFontFamily {
  String get value {
    switch (this) {
      case AppFontFamily.rubik:
        return "Rubik";
      case AppFontFamily.poppins:
        return "Poppins";
      case AppFontFamily.lato:
        return "Lato";
    }
  }
}


class TextView extends StatelessWidget {
  final String data;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color? textColor;
  final Color? underLineColor;
  final Color? backgroundColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final AppFontFamily? fontFamilyType;
  final TextStyle? textStyle;
  final bool? softWrap;
  final bool toUpperCaseText;

  const TextView(
      this.data, {
        super.key,
        this.textAlign,
        this.textOverflow,
        this.maxLines,
        this.textColor,
        this.underLineColor,
        this.backgroundColor,
        this.fontSize = 14.0,
        this.fontWeight,
        this.fontStyle,
        this.letterSpacing,
        this.wordSpacing,
        this.shadows,
        this.textDecoration,
        this.fontFamilyType = AppFontFamily.rubik,
        this.softWrap = true,
        this.textStyle,
        this.toUpperCaseText = false,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      toUpperCaseText ? data.toUpperCase() : data,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: textStyle ??
          TextStyle(
            color: textColor,
            backgroundColor: backgroundColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            shadows: shadows,
            decoration: textDecoration,
            decorationColor: underLineColor,
            fontFamily: fontFamilyType?.value,
            decorationThickness: 2.5,
          ),
    );
  }
}
