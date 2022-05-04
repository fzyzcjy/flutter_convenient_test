import 'package:convenient_test_manager/components/home_page/group_entry_info_widget.dart';
import 'package:convenient_test_manager/stores/suite_info_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageCommandInfoPanel extends StatelessWidget {
  const HomePageCommandInfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suiteInfoStore = GetIt.I.get<SuiteInfoStore>();

    return Observer(builder: (_) {
      return ListView(
        children: [
          const SizedBox(height: 8),
          HomePageGroupEntryInfoWidget(
            groupEntryId: suiteInfoStore.suiteInfo!.rootGroupId,
            showHeader: false,
          ),
          const SizedBox(height: 8),
        ],
      );
    });
  }
}
