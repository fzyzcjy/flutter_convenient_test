import 'dart:io';

import 'package:convenient_test_dev/src/support/compile_time_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

class MyLocalFileComparator extends LocalFileComparator {
  static MyLocalFileComparator get instance => goldenFileComparator as MyLocalFileComparator;

  final Uri goldenBasedirForFailure;

  MyLocalFileComparator({required this.goldenBasedirForFailure})
      : super(Uri.file(path.join(CompileTimeConfig.kAppCodeDir, 'integration_test/dummy.dart'))) {
    assert(basedir == Uri.directory(path.join(CompileTimeConfig.kAppCodeDir, 'integration_test')));
  }

  @override
  Future<String> generateFailureOutput(
    ComparisonResult result,
    Uri golden,
    Uri basedir, {
    String key = '',
  }) async {
    return await super.generateFailureOutput(
      result,
      golden,
      // NOTE hacked
      goldenBasedirForFailure,
      key: key,
    );
  }

  List<MapEntry<String, File>> getAllFailureFiles(Uri golden) {
    // NOTE reference: [LocalComparisonOutput.getFailureFile]
    final fileName = golden.pathSegments.last;
    final testNamePrefix = '${fileName.split(path.extension(fileName))[0]}_';
    final failureFilePrefix =
        path.join(path.fromUri(goldenBasedirForFailure), path.fromUri(Uri.parse('failures/$testNamePrefix')));
  
    return TODO;
  }
}
