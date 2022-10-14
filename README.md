# [flutter_convenient_test](https://github.com/fzyzcjy/flutter_convenient_test)

[![Flutter Package](https://img.shields.io/pub/v/convenient_test.svg)](https://pub.dev/packages/convenient_test)
[![CI](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/ci.yaml/badge.svg)](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/ci.yaml)
[![Post-release](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/post_release.yaml/badge.svg)](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/post_release.yaml)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/45204254806b4790a2d6403b81156e42)](https://app.codacy.com/gh/fzyzcjy/flutter_convenient_test?utm_source=github.com&utm_medium=referral&utm_content=fzyzcjy/flutter_convenient_test&utm_campaign=Badge_Grade_Settings)

Write and debug tests easily, with full action history, time travel, screenshots, rapid re-execution, video records, retryability, interactivity, isolation and more.

## 🚀 Advantages

* **Full action history**: Gain insight on what has happened to the tests - View all actions/assertions taken in the tests, with friendly descriptions.
* **Time travel, with screenshots**: What did the UI look like when that button was tapped 50 steps ago? Now you know everything.
* **Rapid re-execution**: Edit code, save, run - done within seconds, not minutes.
* **Videos recorded**: Watch what has happened, in full detail.
* **Retryability**: No manual `pump`, wait or retry anymore. Just write down what you want, and the framework will retry and wait.
* **Being interactive**: Play with the app interactively, again within seconds.
* **Isolated**: One test will no longer destroy environment of other tests - run each with full isolation (optional feature).

And also...

* **`integration_test` still there**: Freely use everything from `integration_test`, `mockito`,  `test`, etc.
* **Flaky test awareness**: No false alarms, while no blindly ignoring.
* **Suitable for CI**: Run headlessly, with logs to be visualized when needed. 
* **Miscellaneous**: Visually see target regions, run single test/group within seconds, raw logs...

## 📷 Quick demo

<!--README_VIDEO_REPLACEMENT_PLACEHOLDER_ONE-->

<!--README_VIDEO_REPLACEMENT_PLACEHOLDER_TWO-->

https://user-images.githubusercontent.com/5236035/167066810-d0aa36ba-0113-4140-92f9-cec0a9e77ed1.mov

## Stability

It has been used extensively in my own 200kloc Flutter app in production environment.

P.S. Surely, this package - especially the doc - is not yet perfect. If having problems, just [create an issue](https://github.com/fzyzcjy/flutter_convenient_test/issues) and I usually reply quite quickly.

## 📚 Features

### Full action history

> See actions/taps/assertions taken in the tests, with friendly descriptions (in the left panel)

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/a_action_history.gif)

<br>

### Time travel with screenshots

> Tap an action to see its screenshots

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/b_time_travel_screenshot.gif)

P.S. Use mouse wheels and dragging to zoom and pan the screenshots.

<br>

### Rapid re-execution

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

### Retryability

No manual `pump`, wait or retry anymore. Just write down what you want, and the framework will retry and wait.

Example:

```dart
await t.get(find.byTooltip('Fetch Data From Backend')).tap();
// OK even if "fetch data" needs undeterministic time interval. Will automatically pump, wait and retry.
await t.get(find.text('New Data')).should(findsOneWidget);
```

More in quickstart and tutorials below.

### Isolation mode

One test will no longer destroy environment of other tests - now you can run run each with full isolation.

This is especially helpful in big projects (such as mine), when an end-to-end setup is not easy to tear down, and one failed test can cause all subsequent tests to have damaged execution environment and thus fail.

Technical details: If this mode is enabled, a hot restart will be performed after each attempt of each test.

### `integration_test` is still there

You can still use everything from `integration_test`, `mockito`,  `test`, etc. This package is not a reinvented wheel, and has exposed the underlying `integration_test` to you.

If you want to migrate to this package from raw `integration_test`, have a look at Getting Started section below.

### Flaky tests awareness

Flaky is flaky, and we are aware of it. It is neither failed nor success, so you will not be alarmed by false positives, and not completely ignore it.

<!--[TODO screenshot: Several tests, one failed, one flaky, one success]-->

### Golden utility

* Customizable tolerations - allow a portion of pixels to mismatch golden image
* Golden overview page - List and check all golden differences within one page with pan and zoom 
* When a golden assertion fails, its image details will be also shown in the manager panel
* Crop golden images - when you only want a portion of the widget to be captured

(To be documented more thoroughly later [#187](https://github.com/fzyzcjy/flutter_convenient_test/issues/187))

<!--[TODO screenshot]-->

### CI / headless mode

This tool can be run without GUI and only produce log data and exit code, making it suitable to be run in a CI. If you want to examine the details with GUI, just open the generated artifact in the GUI using `Load Report` button.

// TODO: Add more doc about how to use it (informal doc here: https://github.com/fzyzcjy/flutter_convenient_test/issues/240)

### Run single test/group

Tap "Run" icon button after each test or group to re-run *only* that test/group, without running anything else. All within seconds - no need to recompile like what the original test package did.

### Visually see target regions

Useful when replaying videos and screenshots

* `Mark`s have colored borders
* Gestures have visual feedbacks

### Raw logs

Tap "Raw Logs" in the right panel to see raw outputs of a test.

### Header panel

Following is a brief description of the functionalities of each button in the header panel.

* Run All: Run all tests below
* Halt: Stop the currently running worker
* Interactive Mode: Enter "interactive mode" (described above)
* Reload Info: Reload test metadata such as the group names and test names
* Reconnect VM: Connect to the Dart VM of the worker app
* Load Report: Load and display a report generated when `SaveReport` toggle is enabled or run within CI/headless mode
* Golden Diff Page: Enter the golden diff page (described above)

Following are about the toggles:

* Isolation: Whether to enable "isolation mode" (described above)
* UpdateGoldens: Whether to update the golden files on the disk, similar to `--update-goldens` flag in a traditional Flutter test
* Retry: When a test fails, whether to retry (and mark as flaky), or directly mark it failed
* SaveReport: Whether to save logs to a report file, such that it can be visualized later via "Load Report"
* Hover: When hovering the action log panel, whether highlight the hovered entry and immediately show related information
* AutoJump: Whether to jump to newly received action entries
* AutoExpand: Whether to expand and collapse automatically for the newly received test and action entries

## Tutorial: Run examples

1. Clone this repository and enter the `packages/convenient_test/example` folder.
2. Run the example app (e.g. using iOS simulator) via `flutter run /path/to/flutter_convenient_test/packages/convenient_test/example/integration_test/main_test.dart --host-vmservice-port 9753 --disable-service-auth-codes --dart-define CONVENIENT_TEST_APP_CODE_DIR=/path/to/this/app`. Can also be run via VSCode or Android Studio with similar commands.
3. Run the GUI located in `packages/convenient_test_manager`. (See details in section below)
4. Enjoy the GUI!

## Getting started

1. In `pubspec.yaml`, add `convenient_test: ^1.0.0` to the `dependencies` section, and `convenient_test_dev: ^1.0.0` to the `dev_dependencies` section. As normal, we need to `flutter pub get`.
2. Create `integration_test/main_test.dart` file in your app. Fill it like `void main() => convenientTestMain(MyConvenientTestSlot(), () { ... the normal test code you write });`. See [the example package](https://github.com/fzyzcjy/flutter_convenient_test/blob/master/packages/convenient_test/example/integration_test/main_test.dart) for demonstration.
3. Run your app (e.g. using iOS simulator) via `flutter run /path/to/your/app/integration_test/main_test.dart --host-vmservice-port 9753 --disable-service-auth-codes --dart-define CONVENIENT_TEST_APP_CODE_DIR=/path/to/this/app`. Can also be run via VSCode or Android Studio with similar commands.
4. Run the GUI located in `packages/convenient_test_manager`. (See details in section below)
5. Enjoy the GUI!

### Run the `manager`

#### Method 1: Download precompiled binary

There are precompiled binaries for each commit, at the "artifacts" section in [the CI page](https://github.com/fzyzcjy/flutter_convenient_test/actions/workflows/ci.yaml). For example, download `manager_macos` artifact, unzip it, and open it.

Currently only MacOS and Linux has CI for this, and I am willing to accept a PR for Windows.

#### Method 2: `flutter run` / `flutter profile` / `flutter build`

`packages/convenient_test_manager` is nothing but a *normal* Flutter Windows/MacOS/Linux app, so run it following the Flutter official doc.

Surely, it can also be run via `flutter profile` mode to speed up. Or use `flutter build` and the standard approaches to generate a release version binary and use it.

## Miscellaneous

### Configuration

There are a few ways to configure the manager:

1. From `$HOME/.config/convenient_test.json`.
2. From various environment variables.
3. From command line arguments (when run via `convenient_test_manager_dart` command line)
4. Change configurations via GUI (e.g. switches at right-top)

For all options that are configurable and all environment variable names, please see `consts.dart`. (By doing so you can always see the up-to-date information and there is no possiblility to see outdated doc.)

If you are trying to use this package with Android Virtual Emulator (AVD), you may need to set `kConvenientTestManagerHost` to `10.0.2.2` because of its [network topology](https://stackoverflow.com/questions/9808560/why-do-we-use-10-0-2-2-to-connect-to-local-web-server-instead-of-using-computer). Please see issue #253 for more details.

## Contributors

For detailed PRs (excluding myself), please see [this link](https://github.com/fzyzcjy/flutter_convenient_test/pulls?q=is%3Apr+-author%3Afzyzcjy+).

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-8-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/Rohithgilla12"><img src="https://avatars.githubusercontent.com/u/19389850?v=4?s=100" width="100px;" alt="Rohith Gilla"/><br /><sub><b>Rohith Gilla</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=Rohithgilla12" title="Code">💻</a></td>
      <td align="center"><a href="http://mehrankordi.com"><img src="https://avatars.githubusercontent.com/u/1547111?v=4?s=100" width="100px;" alt="Mehran Kordi"/><br /><sub><b>Mehran Kordi</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=MCord" title="Code">💻</a></td>
      <td align="center"><a href="https://github.com/ethancadoo"><img src="https://avatars.githubusercontent.com/u/100008135?v=4?s=100" width="100px;" alt="ethancadoo"/><br /><sub><b>ethancadoo</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=ethancadoo" title="Code">💻</a> <a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=ethancadoo" title="Documentation">📖</a></td>
      <td align="center"><a href="http://vhanda.in"><img src="https://avatars.githubusercontent.com/u/426467?v=4?s=100" width="100px;" alt="Vishesh Handa"/><br /><sub><b>Vishesh Handa</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=vHanda" title="Code">💻</a></td>
      <td align="center"><a href="https://github.com/ostk0069"><img src="https://avatars.githubusercontent.com/u/27538852?v=4?s=100" width="100px;" alt="Takuma Osada"/><br /><sub><b>Takuma Osada</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=ostk0069" title="Code">💻</a></td>
      <td align="center"><a href="https://github.com/ronba"><img src="https://avatars.githubusercontent.com/u/10216856?v=4?s=100" width="100px;" alt="ronba"/><br /><sub><b>ronba</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=ronba" title="Code">💻</a></td>
      <td align="center"><a href="http://pacia.tech"><img src="https://avatars.githubusercontent.com/u/40357511?v=4?s=100" width="100px;" alt="Bartek Pacia"/><br /><sub><b>Bartek Pacia</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=bartekpacia" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center"><a href="https://blog.alexv525.com"><img src="https://avatars.githubusercontent.com/u/15884415?v=4?s=100" width="100px;" alt="Alex Li"/><br /><sub><b>Alex Li</b></sub></a><br /><a href="https://github.com/fzyzcjy/flutter_convenient_test/commits?author=AlexV525" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

Thanks for testing frameworks in JavaScript, especially `Cypress`, for giving inspirations!
