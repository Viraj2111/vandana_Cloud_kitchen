import 'package:flutter/material.dart';
import 'package:vandana/components/colors.dart';

class HorizontalDottedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0, 
      width: double.infinity,// Adjust the height of the line as needed
      child: CustomPaint(
        painter: HorizontalDottedLinePainter(),
      ),
    );
  }
}

class HorizontalDottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = appMainColor // Set the color of the dotted line
      ..strokeWidth = 1.0 // Adjust the thickness of the dotted line
      ..strokeCap = StrokeCap.round;

    double dashWidth = 5.0;
    double dashSpace = 3.0;

    double startX = 0.0;
    double endX = size.width;

    double currentX = startX;

    while (currentX < endX) {
      canvas.drawLine(
          Offset(currentX, size.height / 2),
          Offset(currentX + dashWidth, size.height / 2),
          paint);
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}