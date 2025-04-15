import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:collection/collection.dart';
import 'package:convenient_test_common_dart/convenient_test_common_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: implementation_imports, unnecessary_import
import 'package:flutter_test/src/_matchers_io.dart';
import 'package:path/path.dart' as p;

typedef EnterTextWithoutReplaceLogCallback = void Function(
    TextEditingValue oldValue, TextEditingValue newValue);

extension ExtWidgetTesterEnterText on WidgetTester {
  Future<void> enterTextWithoutReplace(Finder finder, String text,
      {EnterTextWithoutReplaceLogCallback? logCallback}) async {
    // reference: [enterText]
    await TestAsyncUtils.guard<void>(() async {
      for (final textFieldInfo in convenientTestGeneralizedEditableTextInfos) {
        final textField = textFieldInfo.findWidget(this, finder);
        if (textField == null) {
          continue; // try next one
        }

        final oldValue = textFieldInfo.extractTextEditingValue(textField);
        // if (oldValue == null) {
        //   throw Exception('To use `enterTextWithoutReplace`, please ensure your TextField has non-null controller');
        // }

        final newValue = _enterTextWithoutReplaceActOnValue(oldValue, text);
        logCallback?.call(oldValue, newValue);

        await textFieldInfo.showKeyboard(this, finder);
        testTextInput.updateEditingValue(newValue);
        await idle();

        return;
      }

      throw Exception(
          'Have tried all infos in convenientTestGeneralizedTextFieldInfos=$convenientTestGeneralizedEditableTextInfos, but none works.');
    });
  }
}

/// When running `runAsyncEnhanced` and see exception, will call this checker.
/// For example, you may want to ignore certain kinds of exceptions, such as network timeout
// ignore: avoid-global-state
void Function(Object?) convenientTestRunAsyncEnhancedExceptionChecker =
    (e) => expect(e, isNull);

extension ExtWidgetTesterPump on WidgetTester {
  static const _kTag = 'ExtWidgetTester';

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
    // similar to above, only pump
    await pump();
  }

  // useful for widget tests (not for integration tests)
  @Deprecated('Please use `pumpWithRunAsyncUntil`')
  Future<void> runAsyncAndPumpUntil(
    FutureOr<bool> Function() canStop, {
    Duration runAsyncDelay = Duration.zero,
    Duration? pumpDuration,
  }) async {
    await pumpWithRunAsyncUntil(canStop,
        realDelayDuration: runAsyncDelay, pumpDuration: pumpDuration);
  }

  Future<void> pumpAndMaybeSettleWithRunAsync({required bool? settle}) async {
    (settle ?? true)
        ? await pumpAndSettleWithRunAsync()
        : await pumpWithRunAsync();
  }

  /// Like [pumpAndSettle], but allows real async tasks to be executed
  Future<void> pumpAndSettleWithRunAsync({
    Duration? pumpDuration,
    Duration? realDelayDuration,
    Duration? fakeClockTimeout,
    Duration? wallClockTimeout,
  }) async =>
      await pumpWithRunAsyncUntil(
        () => !binding.hasScheduledFrame,
        pumpDuration: pumpDuration,
        realDelayDuration: realDelayDuration,
        fakeClockTimeout: fakeClockTimeout,
        wallClockTimeout: wallClockTimeout,
      );

  // need `runAsync` between pumps, because when running in widget test, the time in pump is fake.
  // If we do not `runAsync` and *really* sleep, things like real network requests may not be able to be finished.
  // https://github.com/fzyzcjy/yplusplus/issues/8477#issuecomment-1528799681
  //
  // implementation ref: `pumpAndSettle`
  /// Like [pumpWithRunAsync], but do it repeatedly until [canStop]
  Future<void> pumpWithRunAsyncUntil(
    FutureOr<bool> Function() canStop, {
    Duration? pumpDuration,
    Duration? realDelayDuration,
    Duration? fakeClockTimeout,
    Duration? wallClockTimeout,
  }) async {
    final startTime = _WallAndFakeClock.now(binding);
    // #8516
    // p.s. The `pumpAndSettle` timeouts at 10 minutes
    final endTime = startTime.add(
      fakeClock: fakeClockTimeout ?? const Duration(minutes: 1),
      wallClock: wallClockTimeout ?? const Duration(minutes: 1),
    );

    return TestAsyncUtils.guard(() async {
      var count = 0;
      do {
        // https://github.com/fzyzcjy/yplusplus/issues/8545#issuecomment-1530741884
        if (!binding.inTest) {
          Log.w('ConvenientTestInteraction',
              'pumpAndSettleWithRunAsync see !inTest thus break');
          break;
        }

        final now = _WallAndFakeClock.now(binding);
        if (now.fakeClock.isAfter(endTime.fakeClock) ||
            now.wallClock.isAfter(endTime.wallClock)) {
          throw FlutterError('pumpWithRunAsyncUntil timed out '
              '(startTime=$startTime, endTime=$endTime, now=$now, pumpCount=$count)');
        }

        if (count > 0 && count % 10 == 0) {
          Log.d('ConvenientTestInteraction',
              'pumpAndSettleWithRunAsync has been running for $count cycles');
        }

        await pumpWithRunAsync(
          pumpDuration: pumpDuration,
          realDelayDuration: realDelayDuration,
        );
        count++;
      } while (!await canStop());
    });
  }

  /// Like [pump], but allows real async tasks to be executed
  Future<void> pumpWithRunAsync({
    Duration? pumpDuration,
    Duration? realDelayDuration,
  }) async {
    // 100ms is pumpAndSettle's default value
    await binding.pump(pumpDuration ?? const Duration(milliseconds: 100));
    // https://github.com/fzyzcjy/yplusplus/issues/8481#issuecomment-1529038831
    await runAsyncEnhanced(() => Future<void>.delayed(
        realDelayDuration ?? const Duration(milliseconds: 10)));
  }

  /// Like [runAsync], but:
  /// 1. Allows re-entrance (if following #337 to patch the code)
  /// 2. Asserts no error is thrown inside the callback
  Future<T> runAsyncEnhanced<T>(Future<T> Function() callback) async {
    if (binding._safeRunningAsyncTasks ?? false) {
      // when already have runAsync, should not call it again, otherwise error "Reentrant call to runAsyncEnhanced() denied."
      Log.d(_kTag,
          'runAsyncEnhanced skip executing real runAsync since already has pending tasks');
      return callback();
    } else {
      final result = await runAsync(callback);

      // runAsync will eat error https://github.com/fzyzcjy/yplusplus/issues/8054#issuecomment-1503370451
      final Object? error = binding.safeTakeExceptionOrDetails();
      if (error != null) {
        // https://github.com/fzyzcjy/yplusplus/issues/9072#issuecomment-1559562515
        final errorMessage = error is FlutterErrorDetails
            ? 'e=${error.exception} s=${error.stack}'
            : '$error';
        debugPrint('runAsyncEnhanced see error:\n$errorMessage');
      }

      convenientTestRunAsyncEnhancedExceptionChecker(error);

      return result as T;
    }
  }
}

extension ExtTestWidgetsFlutterBinding on TestWidgetsFlutterBinding {
  // Use this to allow code be run on both patched and original Flutter framework code #337
  bool? get _safeRunningAsyncTasks {
    try {
      // ignore: avoid_dynamic_calls
      return (this as dynamic).runningAsyncTasks as bool;
      // ignore: avoid_catching_errors
    } on NoSuchMethodError {
      Log.d('ExtTestWidgetsFlutterBinding',
          '`binding.runningAsyncTasks` does not exist. Follow #337 to patch the code to get it.');
      return null;
    }
  }

  @visibleForTesting
  dynamic safeTakeExceptionOrDetails() {
    try {
      // ignore: avoid_dynamic_calls
      return (this as dynamic).takeExceptionDetails();
      // ignore: avoid_catching_errors
    } on NoSuchMethodError {
      return takeException();
    }
  }
}

Future<void> debugWidgetTestSaveScreenshot(
    [Finder? finder, String stem = 'debug_screenshot']) async {
  await TestWidgetsFlutterBinding.instance.runAsync(() async {
    final image = await captureImage(
        (finder ?? find.byType(MaterialApp)).evaluate().single);
    final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
    final path = p.join(
        (goldenFileComparator as LocalFileComparator).basedir.path,
        '$stem.png');
    debugPrint(
        'debugWidgetTestSaveScreenshot save to path=$path image.size=${image.width}x${image.height} byte.length=${bytes.length}');
    File(path).writeAsBytesSync(bytes);
  });
}

class _WallAndFakeClock {
  final DateTime wallClock;
  final DateTime fakeClock;

  const _WallAndFakeClock({required this.wallClock, required this.fakeClock});

  factory _WallAndFakeClock.now(TestWidgetsFlutterBinding binding) =>
      _WallAndFakeClock(
        fakeClock: binding.clock.now(),
        wallClock: DateTime.now(),
      );

  _WallAndFakeClock add({
    required Duration wallClock,
    required Duration fakeClock,
  }) =>
      _WallAndFakeClock(
        wallClock: this.wallClock.add(wallClock),
        fakeClock: this.fakeClock.add(fakeClock),
      );

  @override
  String toString() =>
      'WallAndFakeClock(wallClock: $wallClock, fakeClock: $fakeClock)';
}

const kDefaultConvenientTestGeneralizedEditableTextInfos =
    <GeneralizedEditableTextInfo>[EditableTextInfo()];

// users can customize this, for example, if they have a custom MyTextField which is similar to TextField
// ignore: avoid-global-state
var convenientTestGeneralizedEditableTextInfos =
    kDefaultConvenientTestGeneralizedEditableTextInfos;

abstract class GeneralizedEditableTextInfo<T extends Widget> {
  const GeneralizedEditableTextInfo();

  Type get widgetType => T;

  T? findWidget(WidgetTester tester, Finder finder) => tester
      .widgetList<T>(find.descendant(
          of: finder, matching: find.byType(widgetType), matchRoot: true))
      .singleOrNull;

  TextEditingValue extractTextEditingValue(T widget);

  Future<void> showKeyboard(WidgetTester tester, Finder finder) =>
      tester.showKeyboard(finder);
}

/// Used for [TextField] and [EditableText]
class EditableTextInfo extends GeneralizedEditableTextInfo<EditableText> {
  const EditableTextInfo();

  @override
  TextEditingValue extractTextEditingValue(EditableText widget) =>
      widget.controller.value;

  @override
  String toString() => 'EditableTextInfo{}';
}

// TODO ok?
TextEditingValue _enterTextWithoutReplaceActOnValue(
    TextEditingValue oldValue, String text) {
  if (!oldValue.selection.isValid) {
    final newText = oldValue.text + text;
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
  return oldValue.replaced(oldValue.selection, text);
}
