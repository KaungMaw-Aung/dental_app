import 'dart:math';
import 'dart:ui';

import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class CircleClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var outerCirclePaint = Paint()
      ..color = OUTER_CIRCLE_COLOR
      ..style = PaintingStyle.fill;

    var midCirclePaint = Paint()
      ..color = MID_CIRCLE_COLOR
      ..style = PaintingStyle.fill;

    var innerCirclePaint = Paint()
      ..color = INNER_CIRCLE_COLOR
      ..style = PaintingStyle.fill;

    var dottedCirclePaint = Paint()
      ..color = Colors.white54
      ..style = PaintingStyle.fill;

    var center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 2, outerCirclePaint);

    canvas.drawCircle(center, (size.width / 2) * 0.9, midCirclePaint);

    canvas.drawCircle(center, (size.width / 2) / 2, innerCirclePaint);

    /// drawing dotted circle
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double filledCircleRadius = 1.5;
    double dottedCircleRadius = (size.width / 2) * 0.7;
    int numberOfDots = 20;
    double radiantStep = 2 * pi / numberOfDots;
    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX + sin(i * radiantStep) * dottedCircleRadius,
            centerY + cos(i * radiantStep) * dottedCircleRadius),
        filledCircleRadius,
        dottedCirclePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CircleClockView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 300),
      painter: CircleClockPainter(),
      child: Container(
        width: 300,
        height: 300,
        child: Center(
          child: Column(
            children: const [
              Spacer(),
              Text(
                "2:45",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_HEADING_2X,
                ),
              ),
              SizedBox(height: MARGIN_SMALL),
              Text(
                "pm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
