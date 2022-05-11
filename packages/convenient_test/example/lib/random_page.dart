import 'dart:math';

import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  final randomNumber = Random().nextInt(10000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RandomPage')),
      body: Center(
        child: Text(
          'Random Number: $randomNumber',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
