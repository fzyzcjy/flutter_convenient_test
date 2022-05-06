import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final chosenFruits = arguments is List<String> ? arguments : <String>[];

    return Scaffold(
      appBar: AppBar(title: const Text('SecondPage')),
      body: Center(
        child: Text(
          'See fruits: ${chosenFruits.join(', ')}',
          style: const TextStyle(fontSize: 18, height: 1.5),
        ),
      ),
    );
  }
}
