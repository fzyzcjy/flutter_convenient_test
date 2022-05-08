abstract class HighlightStoreBase {
  void handleLogEntry({required int testEntryId, required int logEntryId});
}

class HighlightStoreDummy implements HighlightStoreBase {
  @override
  void handleLogEntry({required int testEntryId, required int logEntryId}) {}
}
