import 'package:flutter/material.dart';
import '../utils/appcolor.dart';
import 'text_view.dart';


class AppElevatedButton extends StatefulWidget {
  String? title;
  Widget? child;
  Color? color;
  double? height;
  double? width;
  BoxConstraints? constraints;
  double borderRadius;
  Color? titleColor;
  double titleSize;
  FontWeight? titleFontWeight;
  int titleMaxLines;
  TextAlign titleAlign;
  double elevation;
  VoidCallback? onPressed;
  BorderSide? borderSide;
  EdgeInsets? contentPadding;
  double fontSize;

  AppElevatedButton({
    super.key,
    this.title,
    this.child,
    this.color,
    this.height = 50,
    this.width,
    this.constraints,
    this.borderRadius = 8,
    this.titleColor,
    this.titleSize = 16,
    this.titleFontWeight,
    this.titleMaxLines = 1,
    this.titleAlign = TextAlign.center,
    this.elevation = 1.0,
    this.onPressed,
    this.borderSide,
    this.contentPadding,
    this.fontSize = 16,
  }) ;

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      decoration: BoxDecoration(
        gradient: AppColors.horizontalLinear,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation:  widget.elevation,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side:
            BorderSide.none,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.title != null
            ? Padding(
                padding: widget.contentPadding ?? EdgeInsets.zero,
                child: FittedBox(
                  child: TextView(
                    widget.title!,
                    fontSize: widget.fontSize,
                    textColor: Colors.white,
                    fontWeight: widget.titleFontWeight ?? FontWeight.w400,
                  ),
                ),
              )
            : widget.child,
      ),
    );
  }
}
