import 'package:convenient_test_manager/misc/setup.dart';
import 'package:convenient_test_manager/pages/golden_diff_page.dart';
import 'package:convenient_test_manager/pages/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConvenientTestManager',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: HomePage.kRouteName,
      routes: {
        HomePage.kRouteName: (_) => const HomePage(),
        GoldenDiffPage.kRouteName: (_) => const GoldenDiffPage(),
      },
    );
  }
}
