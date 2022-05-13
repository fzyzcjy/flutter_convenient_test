import 'package:flutter/material.dart';

class GoldenDiffPage extends StatelessWidget {
  const GoldenDiffPage({Key? key}) : super(key: key);

  static const kRouteName = '/golden_diff';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('TODO');
  }
}
