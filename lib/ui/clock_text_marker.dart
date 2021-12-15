import 'dart:math' as math;

import 'package:flutter/material.dart';

class ClockTextMarker extends StatelessWidget {
  final int value;
  final int maxValue;
  final double radius;

  const ClockTextMarker({
    required this.value,
    required this.maxValue,
    required this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 30.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2)
        ..rotateZ(math.pi + math.pi * 2 * (value / maxValue))
        ..translate(0.0, radius - 35)
        ..rotateZ(math.pi - math.pi * 2 * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
