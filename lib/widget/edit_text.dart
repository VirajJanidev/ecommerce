import '../utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/appcolor.dart';

class EditText extends StatefulWidget {
  final TextEditingController? controller;
  final double? fontSize;
  final GestureTapCallback? onTap;
  final FontWeight? fontWeight;
  final FocusNode? focusNode;
  final Color? textColor;
  final String? lableText;
  final TextStyle? lableStyle;
  final String? hint;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final double? cursorHeight;
  final double? errorTextHeight;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final bool? autoCorrect;
  bool? obscureText = false;
  bool? enable = true;
  final int? maxLength;
  final bool? filled;
  final InputBorder? border;
  final Color? cursorColor;
  final Color? colorBackground;
  final Color? colorBorder;
  final ValueChanged<String>? onChanged;
  final Color? fillColor;
  bool? showRectangularInputBorder = true;
  bool? showBorder = false;
  final double? borderRadius;
  BorderSide? borderSide;
  final EdgeInsets? contentPadding;
  final FormFieldValidator<String>? validator;
  final int? minLines;
  final int? maxLines;
  final bool? enableSuggestions;
  final bool? enableInteractiveSelection;
  final TextAlign? textAlign;
  final Color? hintTextColor;
  final TextInputAction? inputAction;
  BoxConstraints? prefixIconConstraints;

  final Function(String value)? onFieldSubmitted;

  EditText({
    super.key,
    this.focusNode,
    this.hintTextColor,
    this.onTap,
    this.controller,
    this.fontSize ,
    this.fontWeight = FontWeight.normal,
    this.textColor,
    this.lableText,
    this.lableStyle,
    this.hint,
    this.cursorHeight,
    this.cursorColor = Colors.blue,
    this.colorBackground,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
    this.inputType,
    this.colorBorder,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.autoCorrect = true,
    this.obscureText = false,
    this.maxLength,
    this.filled,
    this.fillColor,
    this.showRectangularInputBorder = false,
    this.showBorder = false,
    this.borderRadius,
    this.borderSide,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 10),
    this.validator,
    this.minLines = 1,
    this.maxLines,
    this.errorTextHeight = 0,
    this.enable = true,
    this.enableSuggestions = true,
    this.enableInteractiveSelection = true,
    this.textAlign = TextAlign.start,
    this.inputAction,
    this.borderColor,
    this.onFieldSubmitted,
    this.onChanged,
    this.prefixIconConstraints,
  }) {
    if (showRectangularInputBorder! && (showBorder == null)) {
      showBorder = true;
    }
    borderSide ??= const BorderSide();
  }

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      controller: widget.controller,
      keyboardType: widget.inputType,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization!,
      autocorrect: widget.autoCorrect!,
      obscureText: widget.obscureText!,
      validator: widget.validator,
      maxLength: widget.maxLength,
      cursorColor: widget.cursorColor,
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: widget.onChanged,
      style: TextStyle(
        fontFamily: Constants.fontfamily,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.textColor,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        enabled: widget.enable??true,
        labelText: widget.lableText,
        labelStyle: widget.lableStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: widget.filled,
        counterText: '',
        fillColor: widget.fillColor,
        border: widget.border,
        hintStyle: widget.hintStyle??TextStyle(
          fontFamily: Constants.fontfamily,
          color: widget.hintTextColor ?? AppColors.textColor,
          fontSize:widget.fontSize?? 14,
        ),
        errorStyle: const TextStyle(fontSize: 10, color: AppColors.red,),
        disabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: widget.borderColor ?? AppColors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 5))),
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: widget.borderColor ?? AppColors.gray, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 5))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.gray, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 5))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: widget.borderColor ?? AppColors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 5))),
        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: widget.borderColor ?? AppColors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 5))),
        contentPadding: widget.contentPadding,
        prefixIconConstraints: widget.prefixIconConstraints,
      ),
      minLines: widget.minLines,
      maxLines: widget.maxLines ?? 1,
      enabled: widget.enable,
      enableSuggestions: widget.enableSuggestions!,
      enableInteractiveSelection: widget.enableInteractiveSelection!,
      textAlign: widget.textAlign!,
      textInputAction: widget.inputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
