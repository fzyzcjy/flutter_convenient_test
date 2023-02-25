import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager/pages/golden_diff_page.dart';
import 'package:convenient_test_manager/pages/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MyApp({super.key, this.themeMode = ThemeMode.system});
  ThemeData _getTheme({required Brightness brightness}) =>
      ThemeData(brightness: brightness, colorSchemeSeed: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConvenientTestManager',
      themeMode: themeMode,
      theme: _getTheme(brightness: Brightness.light),
      darkTheme: _getTheme(brightness: Brightness.dark),
      initialRoute: HomePage.kRouteName,
      routes: {
        HomePage.kRouteName: (_) => const HomePage(),
        GoldenDiffPage.kRouteName: (_) => const GoldenDiffPage(),
      },
    );
  }
}
