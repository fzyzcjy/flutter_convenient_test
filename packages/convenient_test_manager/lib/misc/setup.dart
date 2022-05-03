import 'package:convenient_test_manager/services/convenient_test_manager_service.dart';
import 'package:convenient_test_manager/services/misc_service.dart';
import 'package:convenient_test_manager/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LogStore>(LogStore());
  getIt.registerSingleton<OrganizationStore>(OrganizationStore());
  getIt.registerSingleton<ConvenientTestManagerService>(ConvenientTestManagerService());
  getIt.registerSingleton<VmServiceWrapperService>(VmServiceWrapperService());
  getIt.registerSingleton<MiscService>(MiscService());

  GetIt.I.get<ConvenientTestManagerService>().serve();
}
