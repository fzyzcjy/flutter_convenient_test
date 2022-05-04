import 'package:convenient_test/convenient_test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvenientTestWrapperWidget(
      child: MaterialApp(
        title: 'Example',
        navigatorKey: MyApp.navigatorKey,
        initialRoute: '/home',
        routes: {
          '/home': (_) => const _HomePage(),
          '/second': (_) => const _SecondPage(),
        },
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
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
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondPage')),
      body: const Center(
        child: Text('I am the second page'),
      ),
    );
  }
}

enum MyAppMark {
  button,
}
