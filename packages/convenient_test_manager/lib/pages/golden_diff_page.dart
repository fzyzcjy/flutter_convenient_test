import 'package:convenient_test_manager/components/golden_diff_page/header_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoldenDiffPageHeaderPanel(),
          Divider(height: 1, thickness: 1, color: Colors.grey[200]),
          Expanded(
            child: _buildBody(),
          ),
        ],
      );
    });
  }

  Widget _buildBody() {
    return const Text('TODO');
  }
}
