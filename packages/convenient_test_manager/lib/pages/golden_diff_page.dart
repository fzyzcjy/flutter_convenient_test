import 'package:convenient_test_manager/components/golden_diff_page/detail_diff_panel.dart';
import 'package:convenient_test_manager/components/golden_diff_page/file_info_panel.dart';
import 'package:convenient_test_manager/components/golden_diff_page/header_panel.dart';
import 'package:flutter/material.dart';

class GoldenDiffPage extends StatelessWidget {
  const GoldenDiffPage({super.key});

  static const kRouteName = '/golden_diff';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoldenDiffPageHeaderPanel(),
        Divider(height: 1, thickness: 1, color: Theme.of(context).colorScheme.outline),
        Expanded(
          child: _buildBody(context),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: GoldenDiffPageFileInfoPanel(),
        ),
        Container(width: 8),
        Container(width: 1, color: Theme.of(context).colorScheme.outline),
        const Expanded(
          flex: 2,
          child: GoldenDiffPageDetailDiffPanel(),
        ),
      ],
    );
  }
}
