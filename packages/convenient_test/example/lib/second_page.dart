import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondPage')),
      body: const Center(
        child: Text(
          'I am second page',
          style: TextStyle(fontSize: 18, height: 1.5),
        ),
      ),
    );
  }
}
