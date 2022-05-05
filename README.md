# [WIP] convenient_test

A fast, easy and reliable testing utility on top of `integration_test`, making writing tests as simple as speaking [TODO this sentence does not show most important things]

[TODO write overview and intro]

[TODO not only *write* tests more conventiently, but also *debug* them and *run* them more conveniently]

## Quick demo

[video: Prepare - a test like "assert 0, tap, assert 1, tap, wrongly assert 1". Click "run (that one) test" to run that single test, and see time travel and log etc, and see failure. Tap that failed step to see screenshots. Open VSCode and change that wrong line. Click "run (that) test" again, and see it go green.]

[TODO what is this? notice "video" is not here, need to introduce separately]

## Features

#### Time travel and action history...

See what actions and assertions are done:

[TODO video: execute a test, and see how the log grows]

#### ... with screenshots

Tap an action to see screenshot(s):

[TODO screenshot: tap a step like "click button A", and see "before" and "after" screenshots]

#### ... and videos

[TODO no need to be this detailed?]

* The corresponding action will be highlighted as video plays.
* Tap an action to jump to that video timestamp.
* Play videos using any player you like.

[TODO video: play the video recording of some specific test. then tap an action to jump. then open it using any player.]

#### `integration_test` is still there

Though not necessarily needed, you can still use everything from `integration_test`. This package is not a reinvented wheel.

#### Rapidly re-execute after changing code

[TODO video: ]

[TODO should we make this example the first one? or merge multiple?]

[TODO Change tests quickly: change your test code, save it. then run it using one click. nothing more.]

[TODO can run one single test / a group of tests. all in one click. no need to run all.]

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

#### Raw logs

Tap "Raw Logs" in the right panel to see raw outputs of a test.

## Getting started

[TODO]

---

Thanks for testing frameworks in JavaScript, especially `Cypress`, for giving inspirations!

