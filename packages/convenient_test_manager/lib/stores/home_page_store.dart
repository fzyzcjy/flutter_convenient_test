import 'package:mobx/mobx.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  @observable
  var activeSecondaryPanelTab = HomePageSecondaryPanelTab.screenshot;

  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();
 
  /// key: testId; value: ListView index of *first* log entry of that test
  final rdtListViewIndexOfFirstLogEntryOfTestIdMap = ObservableMap<int, int>();
}

enum HomePageSecondaryPanelTab {
  screenshot,
  rawLog,
  video,
}

extension ExtHomePageSecondaryPanelTab on HomePageSecondaryPanelTab {
  String get title {
    switch (this) {
      case HomePageSecondaryPanelTab.screenshot:
        return 'Screenshots';
      case HomePageSecondaryPanelTab.rawLog:
        return 'Raw Logs';
      case HomePageSecondaryPanelTab.video:
        return 'Video';
    }
  }
}
