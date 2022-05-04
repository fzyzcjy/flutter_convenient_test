import 'package:get_it/get_it.dart';

// need a *new* instance for this package, because other packages may be also using GetIt and even clean
// registrations. In that case, our GetIt-registered instances will also be cleaned which is unexpected.
final myGetIt = GetIt.asNewInstance();
