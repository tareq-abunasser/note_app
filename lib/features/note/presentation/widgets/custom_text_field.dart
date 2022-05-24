import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? inputType;
  final Widget? suffixIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final String? labelText;
  final String? hintText;

  const CustomTextFormField({
    Key? key,
    @required this.inputType,
    this.suffixIcon,
    this.onSaved,
    this.onChanged,
    this.maxLines,
    @required this.controller,
    @required this.validator,
    this.decoration,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      decoration: decoration ??
          InputDecoration(
            filled: true,
            labelText: labelText ?? "",
            hintText: hintText,
            fillColor: Colors.transparent,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFFCCCCCC),
                )),
          ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight})
      : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class CustomTextWithGoogleStyle extends StatelessWidget {
  const CustomTextWithGoogleStyle({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
  }) : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class CustomTextWithCustomStyle extends StatelessWidget {
  const CustomTextWithCustomStyle({
    Key? key,
    required this.text,
    required this.style,
  }) : super(key: key);
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
