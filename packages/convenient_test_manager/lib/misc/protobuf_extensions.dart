import 'package:convenient_test_common/convenient_test_common.dart';

extension ExtLogSubEntry on LogSubEntry {
  DateTime get timeTyped => DateTime.fromMicrosecondsSinceEpoch(time.toInt());
}
