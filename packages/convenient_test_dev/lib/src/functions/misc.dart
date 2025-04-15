import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:convenient_test_dev/src/support/static_config.dart';

extension ConvenientTestMisc on ConvenientTest {
  String get appCodeDir => StaticConfig.kAppCodeDir;
}
