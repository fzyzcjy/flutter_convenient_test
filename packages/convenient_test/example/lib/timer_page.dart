import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final stopwatch = Stopwatch();
  var displayDuration = Duration.zero;
  late final Timer timer;

  @override
  void initState() {
    super.initState();

    stopwatch.start();
    timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() => displayDuration = stopwatch.elapsed);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TimerPage')),
      body: Center(
        child: Text(
          (displayDuration.inMilliseconds / 1000).toStringAsFixed(3),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
