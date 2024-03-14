import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final chosenFruits = arguments is List<String> ? arguments : <String>[];

    return Scaffold(
      appBar: AppBar(title: const Text('SecondPage')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'See fruits: ${chosenFruits.join(', ')}',
                style: const TextStyle(fontSize: 18, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: () => Navigator.pushNamed(context, '/timer'), child: const Text('GoTimerPage')),
                TextButton(onPressed: () => Navigator.pushNamed(context, '/zoom'), child: const Text('GoZoomPage')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
