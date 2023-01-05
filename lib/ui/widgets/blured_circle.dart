import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BlurCircleWidget extends StatefulWidget {
  const BlurCircleWidget(
      {super.key,
      required this.circleWidth,
      required this.blurSigma,
      required this.color});

  final double circleWidth;
  final double blurSigma;
  final Color color;

  @override
  State<BlurCircleWidget> createState() => _BlurCircleWidgetState();
}

class _BlurCircleWidgetState extends State<BlurCircleWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleBlurPainter(
          color: widget.color,
          circleWidth: widget.circleWidth,
          blurSigma: widget.blurSigma),
    );
  }
}

class CircleBlurPainter extends CustomPainter {
  final Color color;
  final double circleWidth;
  final double blurSigma;

  CircleBlurPainter(
      {required this.color,
      required this.circleWidth,
      required this.blurSigma});

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var offset = Offset(centerX, centerY);

    var innerCircleBrush = Paint()
      ..color = color
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma)
      ..strokeWidth = 1;

    canvas.drawCircle(offset, 125, innerCircleBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
