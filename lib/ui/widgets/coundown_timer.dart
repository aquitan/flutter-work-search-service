import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final Function() dismissTimer;

  const CountDownTimer({super.key, required this.dismissTimer});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  dynamic _remainingTime = 59;
  late Timer _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          widget.dismissTimer();
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Отправить повторно через"),
      SizedBox(width: 5),
      Text(
        '00:${_remainingTime < 10 ? '0$_remainingTime' : _remainingTime.toString()}',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    ]);
  }
}
