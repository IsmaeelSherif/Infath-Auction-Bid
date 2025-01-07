

import 'package:flutter/material.dart';

class ClippedContainr extends CustomPainter {

  final Color color;

  ClippedContainr({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double topLeftFract = size.height/2;
    const double bottomRightFract = 15;

    final paint = Paint()..color = color;

    // Define the path for the polygon
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, topLeftFract);
    path.lineTo(topLeftFract, 0);
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(size.width, size.height - bottomRightFract);
    path.lineTo(size.width - bottomRightFract, size.height);
    path.lineTo(0, size.height); // Bottom-left corner


    // Combine the main path and the cutout path
    path.addPath(path, Offset.zero);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}