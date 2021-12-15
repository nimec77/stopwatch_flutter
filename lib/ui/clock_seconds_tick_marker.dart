import 'dart:math' as math;

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  final int seconds;
  final double radius;

  const ClockSecondsTickMarker({
    required this.seconds,
    required this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2)
        ..rotateZ(math.pi * 2 * (seconds / 60))
        ..translate(0.0, radius - height / 2),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
