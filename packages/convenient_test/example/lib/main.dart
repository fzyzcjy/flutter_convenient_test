import 'package:convenient_test/convenient_test.dart';
import 'package:flutter/material.dart';

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
    return ConvenientTestWrapperWidget(
      child: MaterialApp(
        title: 'Example',
        navigatorKey: MyApp.navigatorKey,
        home: Scaffold(
          appBar: AppBar(title: const Text('Example')),
          body: Center(
            child: Text(
              count == 0 ? 'No tap' : (count == 1 ? '1 tap' : '$count taps'),
              style: const TextStyle(fontSize: 18),
            ),
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
