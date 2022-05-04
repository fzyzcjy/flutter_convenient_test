import 'package:convenient_test_common/convenient_test_common.dart';

extension ExtConvenientTestManagerClient on ConvenientTestManagerClient {
  Future<void> reportSingle(ReportItem item) => report(ReportCollection(items: [item]));
}
