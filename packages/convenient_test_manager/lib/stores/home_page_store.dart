import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  @observable
  var activeSecondaryPanelTab = HomePageSecondaryPanelTab.screenshot;
}

enum HomePageSecondaryPanelTab {
  screenshot,
  rawLog,
}

extension ExtHomePageSecondaryPanelTab on HomePageSecondaryPanelTab {
  String get title {
    switch (this) {
      case HomePageSecondaryPanelTab.screenshot:
        return 'Screenshots';
      case HomePageSecondaryPanelTab.rawLog:
        return 'Raw Logs';
    }
  }
}
