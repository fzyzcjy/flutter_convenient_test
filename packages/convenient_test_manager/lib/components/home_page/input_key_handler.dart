import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:convenient_test_manager/stores/log_store.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';

class HomePageInputKeyHandler extends StatefulWidget {
  const HomePageInputKeyHandler({Key? key}) : super(key: key);

  @override
  _HomePageInputKeyHandlerState createState() => _HomePageInputKeyHandlerState();
}

class _HomePageInputKeyHandlerState extends State<HomePageInputKeyHandler> {
  static const _kTag = '_InputKeyHandler';

  final _logStore = GetIt.I.get<LogStore>();
  final _organizationStore = GetIt.I.get<OrganizationStore>();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(_autoRequestFocus);
    WidgetsBinding.instance!.addPostFrameCallback((_) => _autoRequestFocus());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _autoRequestFocus() {
    if (!_focusNode.hasFocus) {
      debugPrint('InputKeyHandler requestFocus');
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  void _handleKeyEvent(RawKeyEvent event) {
    debugPrint('$_kTag _handleKeyEvent $event');
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _moveActiveLogEntry(1);
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _moveActiveLogEntry(-1);
      }
    }
  }

  void _moveActiveLogEntry(int delta) {
    if (_logStore.activeLogEntryId == null) return;

    final activeLogEntry = _logStore.logEntryMap[_logStore.activeLogEntryId!]!;
    final activeTestEntryId = _organizationStore.testEntryNameToId(activeLogEntry.testEntryName);

    final siblingLogEntryIds = _logStore.logEntryInTest[activeTestEntryId]!;
    final oldIndex = siblingLogEntryIds.indexOf(activeLogEntry.id);
    final newIndex = (oldIndex + delta).clamp(0, siblingLogEntryIds.length - 1);

    debugPrint(
        '$_kTag _moveActiveLogEntry delta=$delta old=${_logStore.activeLogEntryId} new=${_logStore.activeLogEntryId}');
    _logStore.activeLogEntryId = siblingLogEntryIds[newIndex];
  }

  @override
  Widget build(BuildContext context) {
    // NOTE ref https://api.flutter.dev/flutter/services/LogicalKeyboardKey-class.html
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: Container(),
    );
  }
}
