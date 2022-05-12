import 'dart:math';

import 'package:convenient_test/convenient_test.dart';
import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  final randomHeight = 30 + Random().nextInt(30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RandomPage')),
      body: Center(
        child: Mark(
          name: RandomPageMark.randomText,
          repaintBoundary: true,
          child: Container(
            height: randomHeight.toDouble(),
            color: Colors.blue.shade50,
            child: Text(
              'Random Height: $randomHeight',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

enum RandomPageMark { randomText }
