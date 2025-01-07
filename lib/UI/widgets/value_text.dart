
import 'package:flutter/material.dart';
import 'package:infath_admin/constants/constants.dart';

class ValueText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  ValueText({required this.text, this.fontSize = 16, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    const strutStyle = StrutStyle(
      forceStrutHeight: true,
      height: 2.3,
    );

    return Text(
      text,
      textAlign: TextAlign.end,
      strutStyle: strutStyle,
      style: TextStyle(
        color: kBluePrimaryColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'LamaSans',
      ),
    );
  }
}
