import 'package:convenient_test_common/convenient_test_common.dart';

class CompileTimeConfig {
  static String get kAppCodeDir =>
      SharedCompileTimeConfig.getConfigFromEnv('CONVENIENT_TEST_APP_CODE_DIR', '', required: true);
}
