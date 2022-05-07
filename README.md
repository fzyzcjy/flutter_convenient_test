# [flutter_convenient_test](https://github.com/fzyzcjy/flutter_convenient_test): Write and debug tests easily, built on `integration_test`

[![Flutter Package](https://img.shields.io/pub/v/convenient_test.svg)](https://pub.dev/packages/convenient_test)
[![CI](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/ci.yaml/badge.svg)](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/ci.yaml)
[![Post-release](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/post_release.yaml/badge.svg)](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/post_release.yaml)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/45204254806b4790a2d6403b81156e42)](https://app.codacy.com/gh/fzyzcjy/flutter_convenient_test?utm_source=github.com&utm_medium=referral&utm_content=fzyzcjy/flutter_convenient_test&utm_campaign=Badge_Grade_Settings)

## Quick demo

<!--README_VIDEO_REPLACEMENT_PLACEHOLDER_ONE-->

<!--README_VIDEO_REPLACEMENT_PLACEHOLDER_TWO-->

https://user-images.githubusercontent.com/5236035/167066810-d0aa36ba-0113-4140-92f9-cec0a9e77ed1.mov

## Have questions?

Though used in production environment in my own 200kloc Flutter app, this package - especially the doc - is surely not yet perfect. Just [create an issue](https://github.com/fzyzcjy/flutter_convenient_test/issues) and I usually reply quite quickly.

## Features

### Action history

> See what actions are taken in the tests (in the left panel)

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/a_action_history.gif)

<br>

### Time travel with screenshots

> Tap an action to see its screenshots

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/b_time_travel_screenshot.gif)

<br>

### Rapidly re-execute

> Edit code, save, run - within seconds

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/c_rapid_execute.gif)

<br>

### Videos recorded

> Watch what has happened in full detail (in right panel)

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/d_video_record.gif)

P.S. Highlighted action is in sync with the playing video. Tap action to seek video.

<br>

### Being interactive

> Temporarily play with the app, interactively. (Flutter originally cannot interact with app in test mode)

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/e_interactive.gif)

<br>

### `integration_test` is still there

You can still use everything from `integration_test`, `mockito`,  `test`, etc. This package is not a reinvented wheel, and has exposed the underlying `integration_test` to you.

If you want to migrate to this package from raw `integration_test`, have a look at Getting Started section below.

### Flaky tests awareness

Flaky is flaky, and we are aware of it. It is neither failed nor success, so you will not be alarmed by false positives, and not completely ignore it.

<!--[TODO screenshot: Several tests, one failed, one flaky, one success]-->

### Simpler and shorter code

* No manual `pump`
* No manual wait and retry

```dart
await t.get(find.byTooltip('Fetch Data From Backend')).tap();
// OK even if "fetch data" needs undeterministic time interval. Will automatically pump, wait and retry.
await t.get(find.text('New Data')).should(findsOneWidget);
```

More in quickstart and tutorials below.

### Visually see target regions

Useful when replaying videos and screenshots

* `Mark`s have colored borders
* Gestures have visual feedbacks

### CI / headless mode

This tool can be run without GUI and only produce log data, making it suitable to be run in a CI. Just run `flutter run integration_test/main_test.dart --dart-define CONVENIENT_TEST_CI_MODE=true`.

If you want to examine the details with GUI, just open the generated artifact in the GUI using `Open File` button.

### Run single test/group

Tap "Run" icon button after each test or group to re-run *only* that test/group, without running anything else.

### Raw logs

Tap "Raw Logs" in the right panel to see raw outputs of a test.

## Tutorial: Run examples

1. Clone this repository and enter the `packages/convenient_test/example` folder.
2. Run the example app (e.g. using iOS simulator) via `flutter run /path/to/flutter_convenient_test/packages/convenient_test/example/integration_test/main_test.dart --host-vmservice-port 9753 --disable-service-auth-codes`. Can also be run via VSCode or Android Studio with similar commands.
3. Run the GUI located in `packages/convenient_test_manager`. It is nothing but a normal Flutter Windows/MacOS/Linux app, so run it follow Flutter official doc. May run in `profile` mode to speed up.
4. Enjoy the GUI!

## Getting started

1. In `pubspec.yaml`, add `convenient_test: ^1.0.0` to the `dependencies` section, and `convenient_test_dev: ^1.0.0` to the `dev_dependencies` section. As normal, we need to `flutter pub get`.
2. Create `integration_test/main_test.dart` file in your app. Fill it like `void main() => convenientTestMain(MyConvenientTestSlot(), () { ... the normal test code you write });`. See [the example package](https://github.com/fzyzcjy/flutter_convenient_test/blob/master/packages/convenient_test/example/integration_test/main_test.dart) for demonstration.
3. Run your app (e.g. using iOS simulator) via `flutter run /path/to/your/app/integration_test/main_test.dart --host-vmservice-port 9753 --disable-service-auth-codes`. Can also be run via VSCode or Android Studio with similar commands.
4. Run the GUI located in `packages/convenient_test_manager`. It is nothing but a normal Flutter Windows/MacOS/Linux app, so run it follow Flutter official doc. May run in `profile` mode to speed up.
5. Enjoy the GUI!

---

Thanks for testing frameworks in JavaScript, especially `Cypress`, for giving inspirations!

