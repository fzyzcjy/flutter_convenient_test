import 'package:convenient_test_manager/stores/golden_diff_page_store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
          ..._buildGitRepoInfo(),
        ],
      ),
    );
  }

  List<Widget> _buildGitRepoInfo() {
    final goldenDiffPageStore = GetIt.I.get<GoldenDiffPageStore>();

    return [
      TextButton(
        onPressed: () async {
          final dirPath = await FilePicker.platform.getDirectoryPath();
          if (dirPath == null) return;
         
          goldenDiffPageStore.gitRepo = dirPath;
        },
        child: const Text('Open Folder'),
      ),
    ];
  }
}
