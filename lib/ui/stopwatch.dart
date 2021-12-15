import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/reset_button.dart';
import 'package:stopwatch_flutter/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';
import 'package:stopwatch_flutter/ui/stopwatch_ticker_ui.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> with SingleTickerProviderStateMixin {
  final _tickerUIKey = GlobalKey<StopwatchTickerUIState>();
  var _isRunning = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;

        return Stack(
          children: [
            StopwatchRenderer(radius: radius),
            StopwatchTickerUI(
              key: _tickerUIKey,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  isRunning: _isRunning,
                  onPressed: _toggleRunning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
    });
    _tickerUIKey.currentState?.toggleRunning(isRunning: _isRunning);
  }

  void _reset() {
    setState(() {
      _isRunning = false;
    });
    _tickerUIKey.currentState?.reset();
  }
}
