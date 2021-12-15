import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;

  const ClockHand({
    required this.rotationZAngle,
    required this.handThickness,
    required this.handLength,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(-handThickness / 2)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handThickness,
        color: color,
      ),
    );
  }
}
