import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

typedef EnterTextWithoutReplaceLogCallback = void Function(TextEditingValue oldValue, TextEditingValue newValue);

extension ExtWidgetTester on WidgetTester {
  Future<void> enterTextWithoutReplace(Finder finder, String text,
      {EnterTextWithoutReplaceLogCallback? logCallback}) async {
    // reference: [enterText]
    await TestAsyncUtils.guard<void>(() async {
      for (final textFieldInfo in convenientTestGeneralizedTextFieldInfos) {
        final textField = textFieldInfo.findWidget(this, finder);
        if (textField == null) {
          continue; // try next one
        }

        final oldValue = textFieldInfo.extractTextEditingValue(textField);
        if (oldValue == null) {
          throw Exception('To use `enterTextWithoutReplace`, please ensure your TextField has non-null controller');
        }

        final newValue = _enterTextWithoutReplaceActOnValue(oldValue, text);
        logCallback?.call(oldValue, newValue);

        await textFieldInfo.showKeyboard(this, finder);
        testTextInput.updateEditingValue(newValue);
        await idle();

        return;
      }

      throw Exception(
          'Have tried all infos in convenientTestGeneralizedTextFieldInfos=$convenientTestGeneralizedTextFieldInfos, but none works.');
    });
  }
}

const kDefaultConvenientTestGeneralizedTextFieldInfos = <GeneralizedTextFieldInfo>[TextFieldInfo()];

// users can customize this, for example, if they have a custom MyTextField which is similar to TextField
// ignore: avoid-global-state
var convenientTestGeneralizedTextFieldInfos = kDefaultConvenientTestGeneralizedTextFieldInfos;

abstract class GeneralizedTextFieldInfo<T extends Widget> {
  const GeneralizedTextFieldInfo();

  Type get widgetType => T;

  T? findWidget(WidgetTester tester, Finder finder) => tester
      .widgetList<T>(find.descendant(of: finder, matching: find.byType(widgetType), matchRoot: true))
      .singleOrNull;

  TextEditingValue? extractTextEditingValue(T widget);

  Future<void> showKeyboard(WidgetTester tester, Finder finder) => tester.showKeyboard(finder);
}

class TextFieldInfo extends GeneralizedTextFieldInfo<TextField> {
  const TextFieldInfo();

  @override
  TextEditingValue? extractTextEditingValue(TextField widget) => widget.controller?.value;

  @override
  String toString() => 'TextFieldInfo{}';
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
