import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

typedef EnterTextWithoutReplaceLogCallback = void Function(TextEditingValue oldValue, TextEditingValue newValue);

extension ExtWidgetTester on WidgetTester {
  Future<void> enterTextWithoutReplace(Finder finder, String text,
      {EnterTextWithoutReplaceLogCallback? logCallback}) async {
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
      logCallback?.call(oldValue, newValue);

      await showKeyboard(finder);
      testTextInput.updateEditingValue(newValue);
      await idle();
    });
  }
}

// TODO ok?
TextEditingValue _enterTextWithoutReplaceActOnValue(TextEditingValue oldValue, String text) {
  if (!oldValue.selection.isValid) {
    final newText = oldValue.text + text;
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
  return oldValue.replaced(oldValue.selection, text);
}
