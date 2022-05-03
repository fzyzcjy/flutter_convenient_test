import 'package:flutter/material.dart';
import 'package:efficient_test/efficient_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return TestToolWrapperWidget(
      child: MaterialApp(
        title: 'Welcome',
        navigatorKey: MyApp.navigatorKey,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome'),
          ),
          body: Center(
            child: Text('Count: $count'),
          ),
          floatingActionButton: Mark(
            name: MyAppMark.button,
            child: FloatingActionButton(
              onPressed: () => setState(() => count++),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

enum MyAppMark {
  button,
}
