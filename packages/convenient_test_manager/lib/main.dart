import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager/pages/golden_diff_page.dart';
import 'package:convenient_test_manager/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

Future<void> main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  final Widget Function(BuildContext context, Widget? child)? builder;

  const MyApp({super.key, this.themeMode = ThemeMode.system, this.builder});

  ThemeData _getTheme({required Brightness brightness}) =>
      ThemeData(brightness: brightness, colorSchemeSeed: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        title: 'ConvenientTestManager',
        themeMode: themeMode,
        theme: _getTheme(brightness: Brightness.light),
        darkTheme: _getTheme(brightness: Brightness.dark),
        // to allow test overriding of routes for getting all the benefits
        // of a MaterialApp (correct theme, Direction, etc).
        initialRoute: builder == null ? HomePage.kRouteName : null,
        builder: builder,
        routes: {
          HomePage.kRouteName: (_) => const HomePage(),
          GoldenDiffPage.kRouteName: (_) => const GoldenDiffPage(),
        },
      ),
    );
  }
}
