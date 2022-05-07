import 'package:get_it/get_it.dart';

extension ExtGetIt on GetIt {
  T? getIfRegistered<T extends Object>() {
    if (!isRegistered<T>()) return null;
    return get<T>();
  }
}
