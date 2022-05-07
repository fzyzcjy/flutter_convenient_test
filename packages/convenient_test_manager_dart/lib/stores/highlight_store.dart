abstract class HighlightStoreBase {
  void handleLogEntry({required String testEntryName, required int logEntryId});
}

class HighlightStoreDummy implements HighlightStoreBase {
  @override
  void handleLogEntry({required String testEntryName, required int logEntryId}) {}
}
