import 'package:flutter/material.dart';

class GoldenDiffPageHeaderPanel extends StatelessWidget {
  const GoldenDiffPageHeaderPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
