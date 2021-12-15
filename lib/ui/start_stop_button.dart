import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  final bool isRunning;
  final VoidCallback? onPressed;

  const StartStopButton({
    required this.isRunning,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: isRunning ? Colors.red[900] : Colors.green[900], // button color
        child: InkWell(
          onTap: onPressed,
          child: Align(
            child: Text(
              isRunning ? 'Stop' : 'Start',
            ),
          ),
        ),
      ),
    );
  }
}
