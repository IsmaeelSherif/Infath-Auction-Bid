

import 'package:flutter/material.dart';

class ClippedOutlineContainer extends StatelessWidget {
  final Color color;
  final double width;
  final Widget child;
  ClippedOutlineContainer({required this.color, required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: _Painter(
              color: color
            ),
          ),

          Center(
            child: child,
          )
        ],
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final Color color;
  _Painter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const double topLeftFract = 20;
    const double bottomRightFract = 15;

    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

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
