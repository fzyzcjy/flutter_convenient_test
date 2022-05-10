import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

typedef EnterTextWithoutReplaceLogCallback = void Function(TextEditingValue oldValue, TextEditingValue newValue);

extension ExtWidgetTester on WidgetTester {
  Future<void> enterTextWithoutReplace(
    Finder finder,
    String text, {
    EnterTextWithoutReplaceLogCallback? logCallback,
    GeneralizedTextFieldInfo? info,
  }) async {
    final effectiveInfo = info ?? const TextFieldInfo();
    // reference: [enterText]
    await TestAsyncUtils.guard<void>(() async {
      final textField =
          widget(find.descendant(of: finder, matching: find.byType(effectiveInfo.widgetType), matchRoot: true));
      final oldValue = effectiveInfo.extractTextEditingValue(textField);
      if (oldValue == null) {
        throw Exception('To use `enterTextWithoutReplace`, please ensure your TextField has non-null controller');
      }

      final newValue = _enterTextWithoutReplaceActOnValue(oldValue, text);
      logCallback?.call(oldValue, newValue);

      await showKeyboard(finder);
      testTextInput.updateEditingValue(newValue);
      await idle();
    });
  }
}

abstract class GeneralizedTextFieldInfo<T extends Object> {
  const GeneralizedTextFieldInfo();

  Type get widgetType => T;

  TextEditingValue? extractTextEditingValue(T widget);
}

class TextFieldInfo extends GeneralizedTextFieldInfo<TextField> {
  const TextFieldInfo();

  @override
  TextEditingValue? extractTextEditingValue(TextField widget) => widget.controller?.value;
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
