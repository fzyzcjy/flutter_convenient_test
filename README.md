# [WIP] convenient_test

A fast, easy and reliable testing utility on top of integration_test, making writing tests as simple as speaking

[TODO write overview and intro]

[TODO it is based on `integration_test` and you can use *everything* of that, *plus* additional functionalities]

[TODO not only *write* tests more conventiently, but also *debug* them and *run* them more conveniently]

## Features

#### Time travel and action history...

See what actions and assertions are done:

[TODO video: execute a test, and see how the log grows]

#### ... with videos and screenshots

Tap an action to see screenshot(s):

[TODO screenshot: tap a step like "click button A", and see "before" and "after" screenshots]

Watch video recordings:

* The corresponding action will be highlighted as video plays.
* Tap an action to jump to that video timestamp.
* Play videos using any player you like.

[TODO video: play the video recording of some specific test. then tap an action to jump. then open it using any player.]

#### Simpler and shorter code...

* No manual `pump`
* No manual wait and retry

```dart
await t.get(find.byTooltip('Fetch Data From Backend')).tap();
// OK even if "fetch data" needs undeterministic time interval. Will automatically pump, wait and retry.
await t.get(find.text('New Data')).should(findsOneWidget);
```

More in quickstart and tutorials below.

#### ... with `integration_test` still there

Though not necessarily needed, you can still use everything from `integration_test`. This package is not a reinvented wheel.

```dart
// surely OK
final Finder fab = find.byTooltip('Increment');
expect(find.text('1'), findsOneWidget);
```

#### Rapidly re-execute after changing code

[TODO Change tests quickly: change your test code, save it. then run it using one click. nothing more.]

[TODO can run one single test / a group of tests. all in one click. no need to run all.]

#### Flaky tests tolerance

[TODO e2e tests tend to be flaky sometimes. we auto retry and report. no need to be alermed by such false positives. ]

[TODO also explicitly show which tests are flaky. report to you (unlike `test` which silently mark it as pass).]

#### Being interactive

[TODO only time of a hot restart. no need to recompile]

#### Visually see target regions

[TODO a. the Marks are explicitly drawn with indicator rects]

[TODO b. taps have visual feedbacks, can be seen in recorded video]

#### CI mode

[TODO explain]

#### Raw logs

[TODO explain]

## Getting started

[TODO]

---

Thanks for testing frameworks in JavaScript, especially `Cypress`, for giving inspirations!

