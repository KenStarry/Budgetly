import 'package:flutter/cupertino.dart';

/// Rounded Lines
class RoundedLinesStyle extends CustomPainter {
  final Color color;

  const RoundedLinesStyle({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var point1 = Offset(size.width - 16, 16);
    var point2 = Offset(size.width * 0.65, size.height * 0.5);

    var point3 = Offset(size.width - 16, size.height * 0.35);
    var point4 = Offset(size.width * 0.85, size.height * 0.5);

    var point5 = Offset(size.width * 0.75, 16);
    var point6 = Offset(size.width * 0.62, size.height * 0.25);

    var paint = Paint()
      ..color = color
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(point1, point2, paint);
    canvas.drawLine(point3, point4, paint);
    canvas.drawLine(point5, point6, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
