import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ResetButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.grey[900], // button color
        child: InkWell(
          onTap: onPressed,
          child: const Align(
            child: Text(
              'Reset',
            ),
          ),
        ),
      ),
    );
  }
}
