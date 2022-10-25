## 1.2.1

* Fix CI #287 (thanks @AlexV525)

## 1.2.0

* Fix dependency resolution issues and improve Actions #274 (thanks @bartekpacia)
* Adds a settle argument to tTestWidgets #273 (thanks @ronba)
* Fix bug causing config switches to be covered #268 (thanks @ethancadoo)
* flag to prevent pumpAndSettle for other commands #267 (thanks @ostk0069)
* Build conventient_test_manager_dart on Linux #265 (thanks @vHanda)
* Pass cmd args through to config #263 (thanks @ethancadoo)
* Command line args for gRPC connection #258 (thanks @ethancadoo)
* Add note about AVD in readme #257 (thanks @ethancadoo)
* Added Linux CI #255 (thanks @ethancadoo)
* Feature: add a settle flag to act method to prevent pumpAndSettle #252 (thanks @MCord)
* crop golden images - when you only want a portion of the widget to be captured #251
* Fix build issues in the CI pipeline #241 (thanks @Rohithgilla12)
* send hot restart to main isolate #237
* enhance golden comparator #233
* Enhance golden comparator #232
* Fix assertion failed when takeSnapshot: '!renderObject.debugNeedsPaint' is not true #234

## 1.1.1

* Fix when `flutter build macos` for Manager, it shows error: `Undefined symbols for architecture arm64: "_g_players", referenced from: +[VideoOutlet outletForPlayer:withTextureRegistry:] in VideoOutlet.o` #221
* Allow configuration by reading a config file (e.g. `~/.config/convenient_test.json`), useful for using precompiled Manager #220 
* Fix building Windows application... dart_vlc-0.1.9/lib/src/widgets/controls.dart(185,55): error G76A9B1F6: The method 'back' isn't defined for the class 'Player'. #217 
* Make initial window size bigger, otherwise many things overflowed #222
* Make MacOS CI pass, such that we have precompiled binaries #186
* Improve documentation

## 1.1.0

Issues closed:

* create universal configuration, accept params from cmdargs, dart-define, etc #213
* allow Manager to load and display a Report without existence of worker #211
* GoldenDiffPage: set FilterQuality be none if zoom in (physical size much larger), and mid if zoom out #206
* GoldenDiffPage: allow pan/zoom an image, and other images should synchronously pan/zoom the same location #205
* GoldenDiffPage: compute pixelwise difference and show it #204
* GoldenDiffPage: allow arrow up/down key to navigate #203
* for updateGoldens, give a GUI to check golden files git diff #201
* macos + flutter 3.0, fail to compile #199
* migrate to flutter 3.0 #198
* add "root finder" to easily find the root widget #197
* `Mark.repaintBoundary` flag does not work when in combination with goldens #196
* when golden fails because "image sizes do not match", should still provide visual diff #195
* improve the "screenshot panel", especially when it is showing golden images #192
* when `generateFailureOutput` (i.e. one golden fails), currently it outputs one log, so (1) it will not remove log if with retry it succeed (2) tons of log exists #191
* create "super-run-id", and let Report and Video output to subfolders of a folder named by superRunId, such that different super-runs are naturally grouped #190
* gRPC error on M1 Macos #182
* configure macos Manager such that it can be compiled into release executables - currently can always use `flutter run/flutter profile` even without doing this #181
* manage golden `failure`s, generate them onto convenient_test data dirs #180
* explicitly show which golden test fails, by marking them on LogEntry (or throwing exceptions at the locations expectLater fails) #179
* visualize golden test failures clearly in our Manager #178
* "match golden" errors if the match fails #177
* display icon name instead of the default hex number if using `find.byIcon` #176
* implement "append text to TextField" - current `enterText` will replace all text #175
* add sticky header for log panel, such that know which test is looking at - possibly show group names & test name; only visible if the topmost visible item is a log entry #174
* make route name matcher have better description #171
* make text of matchers like `findsOneWidget` more brief #170
* beautify "section" log entry UI, let users easily see this is section header #169
* add `Mark.repaintBoundary` parameter to easily add RepaintBoundary at test time for goldens #168
* implement two-finger gestures #167
* add various gesture detection tests #166
* in ci mode, when manager has started but worker has not yet started, should gracefully handle this case #165
* improve logging in ci mode: at least know which test is executing and how many remain #163
* add a hint text indicating "all tests finished" or "running some tests" #162
* maybe improve grammar: `t.get(find.text('hi')).tap()`/`.should(...)` -> `find.text('hi').tap()`/`.should(...)` #159
* make "logging reports to files" optional #157
* make write-file paths into sub-directories, currently all into the root temp dir making it messy #156
* further improve the top toolbar, since we are going to add more buttons and it will overflow #152
* Using outdated get_it version #150
* allow dynamically configure number of retries in panel #149
* when test name has special char like "+", regex fails #148
* exception when finished running tests in isolation mode #145
* for flaky tests, the "play video" button only plays the *first* video among all, instead of all videos #142
* do not show full error dialog, but collapse it by default and allow expand #141
* use hashcode+conflict-then-change to generate Test/Group `id` that is stable across hot-restarts #140
* add `dart-code-metrics`, especially check "access map operator[] with wrong key type", because things like #136 will easily have such problems #137
* avoid referencing Test/Group via `id`, because they do not preserve across hot-restarts - use `name`s instead #136
* When tap to run a test, have NPE error for `_GroupInfoSectionBuilder._buildHeader` #135
* bug: after tapping "play video" button, no video is shown #134
* still use names to identify Test/Group instead of the newly proposed id; but throw error if there are duplicated names #133
* Test/Group id should stay stable across hot-restarts - because in "isolation mode" and with #130, we use id to identify tests across hot restarts #132
* protobuf should use int64 instead of int32 for (new) id, since we use snowflake which is 64bit #131
* generate and use unique `id`s to determine tests and groups, since currently used test `name`s can be duplicate #130
* remove entryLocator, since test name is prefixed with group name, so no need to use group name to locate test name #129
* flutter test seems to allow *duplicated* names (even in same groups), but we rely on names to locate tests #128
* improve the "header panel" since too many items now #127
* remove the ManagerRpcService (abstraction layer above grpc to Manager), since will use new approach for CI mode #126
* let VideoDisplayStore/VideoPanel understand existence of multiple videos (currently only understand one) #125
* add a boot time config to specify whether to enable "hot-restart for every test" mode #124
* when in "hot-restart for every test" mode, also hot restart when a test is flaky and want to re-execute #123
* make the to-be-implemented "hot-restart for every test" an configurable optional feature #119
* refactor "ci mode" from pure-worker approach into the manager-aided approach #118
* extract pure-dart "manager_dart" from the "manager" package, such that it can run without gui; extract common_dart from common as well #117
* extensive golden support #116
* make generated id in worker be unique even across VM hot restart, by using a snowflake-like approach #115
* hot-restart every time a test is to be executed to improve isolation #113
* the intro video uploaded to youtube is blur #112

## 1.0.1+3

* Use high resolution intro video

## 1.0.1+2

* Use an image instead of video in pub.dev doc

## 1.0.1+1

* Further attempt to add preview video to pub.dev

## 1.0.1

* Update README with a video

## 1.0.0

* Initial release

Issues closed:

* add post-release CI (just like flutter_rust_bridge) to ensure in-git-tree code works well with pub-released versions #106
* after readme is updated, release a new pub package version to update doc there #105
* make CI pass #103
* when tap "play video" button, should auto change to video sub-panel #101
* nested group name should not have unnecessary prefix #98
* mimic flutter official "integration test" tutorials, and put it in our example, to show how the same thing can be more convenient #97
* improve the example package's main.dart and integration_test code #96
* doc: add enough screenshots and mini-videos(or gifs) to each feature, since a picture worth a thousand words #95
* build a "profiling" build and see whether it is smooth - if not, fix it #92
* for half-visible entries, should also jump (unless it has too large height) #90
* change ScrollPhysics of the command panel, otherwise when using ScrollablePositionedList's jump, will have unwanted spring effects #89
* create "hover mode" toggle, only if enabled, hovering an entry will have effects #86
* add a button, only play video of this specific test, and stop once finished, instead of playing the whole video of many tests #84
* let CommandInfoPanel be a (real) ListView, instead of lots of nested Columns, otherwise performance bad #83
* when highlighting a logentry, must scroll it to make it visible, if it is originally not visible #82
* implement VideoPlayerController for dart_vlc #81
* maybe add a banner in app, showing last log entry, to accurately see what is happening at that time #80
* maybe use external vlc player and communicate with it #79
* add "open externally" button for video #78
* create example page that displays a counter in order to test video functionality #76
* the "seek" of vlc video player seems bad #75
* add a fine-grained play position bar #74
* automatically detect vmservice is alive or not, before sending operations like restart #67
* add timestamps on log entry, and display it #66
* allow playing the video with extra speed / slower speed #65
* when playing the video, auto highlight corresponding test group & test entry & log entry #64
* when tapping a log entry, auto jump to that time of the video #63
* run tests selected by a provided customized regex #62
* run a whole group of tests (currently, only "all tests" or "one single test") #61
* take a video (not only screenshots) for the whole testing process, easing debugging, especially some transitioning problems #60
* for failed assertions, add a "just before fail" snapshot #58
* when calling and waiting "hot restart app", give some visual feedback #56
* add a "halt" button, which forcefully stop the running tests, while preserving all logs #55
* in manager, detect whether vmservice is disconnected and show corresponding errors #54
* add time information to raw logs #53
* when running in ci mode, should auto exit process when done #51
* generate prebuilt binaries for `convenient_test_manager` for releases #50
* bug: state status is not cleared across runs #48
* (low priority) slight optimization: use a "string pool", such that no need to repeat test/group name (Strings) over and over again, and only need to use integer (pool indices) #46
* check tests with same name (but different groups) - should not be buggy in such cases #45
* avoid hardcode `managerHost` in MyConvenientTestSlot example (otherwise cannot run on other computers) #44
* reportRunnerMessage has error for tearDownAll #43
* let Manager app runnable on Windows, MacOS and Linux (currently only MacOS) #40
* add icons to Manager app (macos/windows/linux/... platforms) #39
* demonstrate how to use plain-old code in `integration_test` (add a few tests inside example package) #38
* doc: further improve the example package #37
* switch app be in "normal" and "testing" mode (normal mode - just like a normal app where you can interact with it; test mode - like when you execute integration_test, you cannot interact with app) #34
* display nested TestGroups nicely #32
* ci mode: run tests (the app) without manager + generate an output file + manager can open this file for later analysis #31
* doc: smooth conversion from old integration_test based code - just change a few places and you are ready to use convenient_test #30
* improve UX of "section"s #29
* add more example scenarios in the default example #28
* enhance SelectableText: (1) copy-all button (2) ctrl-c to copy #25
* use monospace fonts to improve display #24
* improve situation when app firstly launch and manager launch later #22
* cannot compile manager (possibly due to refactor) #21
* doc: "get started" section - how to integrate this library into the user's project #20
* doc: "tutorial" section - how to run the in-tree example #19
* Collect all logs from worker into manager, and display it when user requests #18
* Allow copying texts in convenient_test_manager #17
* Automatically retry a few times before report "failing", i.e. "flaky tests" #16
* doc: create one single long video for demonstration, and upload it #15
* doc: make a few short videos demonstrating features #14
* doc: overview section & one-sentence description #13
* doc: "details" section describing every feature #12
* doc: "advantage" section briefly introducing interesting things #11
* doc: create an icon and a logo #10
* misc descriptions in various places #9
* create automated releasing script & version-bumping script & release first version #7
* update pubspec.yaml & github/settings.yml & README/CHANGELOG of each package for publishing #6
* set up the bots in `.github` folder #5
* write down README.md of this repo #4
* set up github-related things: issue template, contributing.md, etc #3
* set up github CI #2
* Move code from internal codebase to this public repository #1
