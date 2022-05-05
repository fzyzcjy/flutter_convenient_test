import 'package:convenient_test/convenient_test.dart';
import 'package:convenient_test_example/home_page.dart';
import 'package:convenient_test_example/second_page.dart';
import 'package:convenient_test_example/timer_page.dart';
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
          '/home': (_) => const HomePage(),
          '/second': (_) => const SecondPage(),
          '/timer': (_) => const TimerPage(),
        },
      ),
    );
  }
}
