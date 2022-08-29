import 'package:convenient_test_manager/stores/golden_diff_page_store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class GoldenDiffPageHeaderPanel extends StatelessWidget {
  const GoldenDiffPageHeaderPanel({super.key});

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
          const SizedBox(width: 24),
          ..._buildGitRepoInfo(),
          TextButton(
            onPressed: () async {
              final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();
              final gitRepo = goldenDiffPageStore.gitRepo;
              // trigger refresh
              goldenDiffPageStore
                ..gitRepo = null
                ..gitRepo = gitRepo;
            },
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGitRepoInfo() {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    return [
      const Text(
        'Active Folder: ',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
      ),
      Observer(
        builder: (_) => Text(
          goldenDiffPageStore.gitRepo ?? '(Not Selected)',
          style: const TextStyle(),
        ),
      ),
      const SizedBox(width: 8),
      TextButton(
        onPressed: () async {
          final dirPath = await FilePicker.platform.getDirectoryPath();
          if (dirPath == null) return;

          goldenDiffPageStore.gitRepo = dirPath;
        },
        child: const Text('Open'),
      ),
    ];
  }
}
