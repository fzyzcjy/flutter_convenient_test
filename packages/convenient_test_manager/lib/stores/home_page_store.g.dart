// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStore, Store {
  late final _$displayLoadedReportModeAtom =
      Atom(name: '_HomePageStore.displayLoadedReportMode', context: context);

  @override
  bool get displayLoadedReportMode {
    _$displayLoadedReportModeAtom.reportRead();
    return super.displayLoadedReportMode;
  }

  @override
  set displayLoadedReportMode(bool value) {
    _$displayLoadedReportModeAtom
        .reportWrite(value, super.displayLoadedReportMode, () {
      super.displayLoadedReportMode = value;
    });
  }

  late final _$activeSecondaryPanelTabAtom =
      Atom(name: '_HomePageStore.activeSecondaryPanelTab', context: context);

  @override
  HomePageSecondaryPanelTab get activeSecondaryPanelTab {
    _$activeSecondaryPanelTabAtom.reportRead();
    return super.activeSecondaryPanelTab;
  }

  @override
  set activeSecondaryPanelTab(HomePageSecondaryPanelTab value) {
    _$activeSecondaryPanelTabAtom
        .reportWrite(value, super.activeSecondaryPanelTab, () {
      super.activeSecondaryPanelTab = value;
    });
  }

  late final _$expandSecondaryPanelAtom =
      Atom(name: '_HomePageStore.expandSecondaryPanel', context: context);

  @override
  bool get expandSecondaryPanel {
    _$expandSecondaryPanelAtom.reportRead();
    return super.expandSecondaryPanel;
  }

  @override
  set expandSecondaryPanel(bool value) {
    _$expandSecondaryPanelAtom.reportWrite(value, super.expandSecondaryPanel,
        () {
      super.expandSecondaryPanel = value;
    });
  }

  @override
  String toString() {
    return '''
displayLoadedReportMode: ${displayLoadedReportMode},
activeSecondaryPanelTab: ${activeSecondaryPanelTab},
expandSecondaryPanel: ${expandSecondaryPanel}
    ''';
  }
}
