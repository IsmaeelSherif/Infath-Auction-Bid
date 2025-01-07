
import 'package:flutter/material.dart';
import 'package:infath_admin/constants/constants.dart';

class LabelText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  LabelText({required this.text, this.fontSize = 16, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(
          color: kBluePrimaryColor,
          fontSize: fontSize,
          fontFamily: 'RuaqArabic',
          fontWeight: fontWeight
      ),
    );
  }
}
