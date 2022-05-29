import 'dart:io';
import 'dart:ui' as ui;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/src/_matchers_io.dart'; // ignore: implementation_imports
import 'package:path/path.dart' as p;

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

  // useful in widget-test environment
  // *not* useful integration-test environment, which is what *this* package does
  // https://github.com/fzyzcjy/yplusplus/issues/3793#issuecomment-1120570555
  Future<void> flushRealAsyncTasks([int repeat = 10]) async {
    for (var i = 0; i < repeat; ++i) {
      await runAsync(() => Future<void>.delayed(Duration.zero));
      // only pump (no "pumpAndSettle") here - since sometimes a runAsync task will trigger some background
      // execution that has not finished after delaying zero seconds.
      // see https://github.com/fzyzcjy/yplusplus/issues/4051#issuecomment-1140359618 for more details
      await pump();
    }
    await pumpAndSettle();
  }

  // useful for widget tests (not for integration tests)
  Future<void> debugWidgetTestSaveScreenshot([Finder? finder, String stem = 'debug_screenshot']) async {
    await runAsync(() async {
      final image = await captureImage(element(finder ?? find.byType(MaterialApp)));
      final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
      final path = p.join((goldenFileComparator as LocalFileComparator).basedir.path, '$stem.png');
      debugPrint(
          'debugWidgetTestSaveScreenshot save to path=$path image.size=${image.width}x${image.height} byte.length=${bytes.length}');
      File(path).writeAsBytesSync(bytes);
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
