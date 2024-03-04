import 'package:flutter/material.dart';

class GobleText extends StatelessWidget {
  final String text;
  TextStyle? textStyle;
  String? fontfamily;
  double? fontsize;
  dynamic? fontWeight;
  Color? color;
  GobleText(
      {super.key,
        required this.text,
        this.fontfamily,
        this.color,
        this.textStyle,
        this.fontsize,
        this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: textStyle ??
          TextStyle(
            fontFamily: fontfamily ?? 'Poppins',
            color: color ?? Colors.white,
            fontSize: fontsize ?? 24,
            fontWeight: fontWeight ?? FontWeight.w500,

          ),
    );
  }
}
