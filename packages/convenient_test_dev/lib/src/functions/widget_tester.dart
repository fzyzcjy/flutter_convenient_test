import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension ExtWidgetTester on WidgetTester {
  Future<void> enterTextWithoutReplace(Finder finder, String text) async {
    // reference: [enterText]
    await TestAsyncUtils.guard<void>(() async {
      final TextField textField =
          widget(find.descendant(of: finder, matching: find.byType(TextField), matchRoot: true));
      final controller = textField.controller;
      if (controller == null) {
        throw Exception('To use `enterTextWithoutReplace`, please ensure your TextField has non-null controller');
      }

      final oldValue = controller.value;
      final newValue = _enterTextWithoutReplaceActOnValue(oldValue, text);

      await showKeyboard(finder);
      testTextInput.updateEditingValue(newValue);
      await idle();
    });
  }
}

TextEditingValue _enterTextWithoutReplaceActOnValue(TextEditingValue oldValue, String text) {
  // TODO ok?
  return oldValue.replaced(oldValue.selection, text);
}
