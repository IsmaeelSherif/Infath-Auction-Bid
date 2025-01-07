
import 'package:flutter/material.dart';
import 'package:infath_admin/constants/constants.dart';

import 'clipped_container.dart';

class CyanContainer extends StatelessWidget {

  final String text;
  final double width;
  final double height;
  final double fontSize;

  CyanContainer({required this.text, this.width = 100, this.height = 30, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: ClippedContainr(
              color: kCyanPrimaryColor
            ),
          ),

          Center(
            child: Text(
              text,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontFamily: 'LamaSans',
                fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}
