# [WIP] convenient_test

A fast, easy and reliable testing utility on top of `integration_test`, making writing tests as simple as speaking [TODO this sentence does not show most important things]

[TODO write overview and intro]

[TODO not only *write* tests more conventiently, but also *debug* them and *run* them more conveniently]

## Quick demo

[TODO merge things below into one video. especially good, because the first several subsections *is just a continuous story*!]

[TODO note: let's make each page have a different background color]

## Features

#### Action history

[TODO video: Prepare - a test like "assert 0, tap, input text, etc, assert 1, tap, wrongly assert 1", notice need to have ~10 steps so more beautiful. Click "run (that one) test" to run that single test, and see time travel and log etc, and see failure.]

[TODO about the video screen: just screenshot the exact size of the Manager, do not be bigger. Otherwise, the ppt looks bad. When needing VSCode, just let it be (partially) inside this region.]

#### Time travel with screenshots

[TODO video: Hover through each step, especially the "tap/inputtext" steps, and see screenshots.]

#### Rapidly re-execute

[TODO video: Open VSCode and change that wrong line. Click "run (that) test" again, and see it immediately re-run and go green.]

#### Videos recorded

[TODO video: Tap "video" icon button. Then see the video recording.]

P.S. Highlighted action is in sync with the playing video. Tap action to seek video.

#### `integration_test` is still there

Though not necessarily needed, you can still use everything from `integration_test`. This package is not a reinvented wheel.

#### Flaky tests awareness

Flaky is flaky, and we are aware of it. It is neither failed nor success, so you will not be alarmed by false positives, and not completely ignore it.

[TODO screenshot: Several tests, one failed, one flaky, one success]

#### Being interactive

Want to temporarily play with the app interactively, but Flutter's test mechanism enforces that you cannot interact with it?

Just click `Interactive Mode` button, and within a second you are ready to go.

#### Simpler and shorter code

* No manual `pump`
* No manual wait and retry

```dart
await t.get(find.byTooltip('Fetch Data From Backend')).tap();
// OK even if "fetch data" needs undeterministic time interval. Will automatically pump, wait and retry.
await t.get(find.text('New Data')).should(findsOneWidget);
```

More in quickstart and tutorials below.

#### Visually see target regions

Useful when replaying videos and screenshots

* `Mark`s have colored borders
* Gestures have visual feedbacks

#### CI / headless mode

This tool can be run without GUI and only produce log data, making it suitable to be run in a CI. Just run `flutter run integration_test/main_test.dart --dart-define CONVENIENT_TEST_CI_MODE=true`.

If you want to examine the details with GUI, just open the generated artifact in the GUI using `Open File` button.

#### Run single test/group

Tap "Run" icon button after each test or group to re-run *only* that test/group, without running anything else.

#### Raw logs

Tap "Raw Logs" in the right panel to see raw outputs of a test.

## Tutorial: Run examples

1. Clone this repository and enter the `packages/convenient_test/example` folder.
2. Run the example app (e.g. using iOS simulator) via `flutter run /path/to/flutter_convenient_test/packages/convenient_test/example/integration_test/main_test.dart --host-vmservice-port 9753 --disable-service-auth-codes`. Can also be run via VSCode or Android Studio with similar commands.
3. Run the GUI located in `packages/convenient_test_manager`. It is nothing but a normal Flutter (desktop) app, so run it follow Flutter official doc. May run in `profile` mode to speed up.
4. Enjoy the GUI!

## Getting started

1. In `pubspec.yaml`, add `convenient_test: ^1.0.0` to the `dependencies` section, and `convenient_test_dev: ^1.0.0` to the `dev_dependencies` section. As normal, we need to `flutter pub get`.
2. Create `integration_test/main_test.dart` file in your app. Fill it like `void main() => convenientTestMain(MyConvenientTestSlot(), () { ... the normal test code you write });`. See [the example package](https://github.com/fzyzcjy/flutter_convenient_test/blob/master/packages/convenient_test/example/integration_test/main_test.dart) for demonstration.
3. Run your app (e.g. using iOS simulator) via `flutter run /path/to/your/app/integration_test/main_test.dart --host-vmservice-port 9753 --disable-service-auth-codes`. Can also be run via VSCode or Android Studio with similar commands.
4. Run the GUI located in `packages/convenient_test_manager`. It is nothing but a normal Flutter (desktop) app, so run it follow Flutter official doc. May run in `profile` mode to speed up.
5. Enjoy the GUI!

---

Thanks for testing frameworks in JavaScript, especially `Cypress`, for giving inspirations!

