import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopwatchTickerUI extends StatefulWidget {
  final double radius;

  const StopwatchTickerUI({required this.radius, Key? key}) : super(key: key);

  @override
  State<StopwatchTickerUI> createState() => StopwatchTickerUIState();
}

class StopwatchTickerUIState extends State<StopwatchTickerUI> with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  var _previouslyElapsed = Duration.zero;
  var _currentlyElapsed = Duration.zero;

  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: widget.radius,
          top: widget.radius,
          child: ClockHand(
            handLength: widget.radius,
            handThickness: 2,
            rotationZAngle: math.pi + (math.pi * 2 / 60000) * _elapsed.inMilliseconds,
            color: Colors.orange,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: widget.radius * 1.3,
          child: ElapsedTimeText(elapsed: _elapsed),
        ),
      ],
    );
  }

  void toggleRunning({required bool isRunning}) {
    setState(() {
      if (isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  void reset() {
    _ticker.stop();
    setState(() {
      _previouslyElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }
}
