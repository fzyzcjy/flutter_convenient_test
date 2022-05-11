import 'package:convenient_test_dev/src/support/compile_time_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

class MyLocalFileComparator extends LocalFileComparator {
  MyLocalFileComparator() : super(Uri.file(path.join(CompileTimeConfig.kAppCodeDir, 'integration_test/dummy.dart'))) {
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
      _basedirForFailureOutput,
      key: key,
    );
  }

  // failures will be at `this_folder/failures/some_file.png`, according to logic of [generateFailureOutput]
  Uri get _basedirForFailureOutput {
    return TODO;
  }
}
