import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});
  static const String routeName = '/timer';

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView>
    with SingleTickerProviderStateMixin {
  final Duration _duration = Duration(minutes: 25);
  Duration _remaining = Duration(minutes: 25);
  Timer? _timer;
  bool _isRunning = false;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_remaining.inSeconds > 0) {
        setState(() => _remaining -= Duration(seconds: 1));
      } else {
        _timer?.cancel();
        setState(() => _isRunning = false);
      }
    });
    setState(() => _isRunning = true);
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _remaining = _duration;
      _isRunning = false;
    });
  }

  String _format(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  double _progress() => 1 - (_remaining.inSeconds / _duration.inSeconds);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            painter: TimerArcPainter(progress: _progress()),
            child: Container(
              width: 220,
              height: 220,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _format(_remaining),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "just focus",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _IconButton(icon: Icons.stop_rounded, onTap: _resetTimer),
              SizedBox(width: 20),
              _IconButton(
                icon:
                    _isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                onTap: _isRunning ? _pauseTimer : _startTimer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerArcPainter extends CustomPainter {
  final double progress;

  TimerArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 12.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final backgroundArc =
        Paint()
          ..color = Colors.grey.shade200
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    final progressArc =
        Paint()
          ..shader = LinearGradient(
            colors: [Color(0xFFBCA8F8), Color(0xFF9D89F7)],
          ).createShader(Rect.fromCircle(center: center, radius: radius))
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    // Background arc (full circle)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -pi / 2,
      2 * pi,
      false,
      backgroundArc,
    );

    // Foreground arc (partial progress)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -pi / 2,
      2 * pi * progress,
      false,
      progressArc,
    );
  }

  @override
  bool shouldRepaint(covariant TimerArcPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
