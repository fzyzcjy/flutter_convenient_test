# Rethink testing in Flutter: Reduce the time-wasters

We have all heard that testing is of crucial importance, and it has tons of benefits such as improving confidence and reducing bugs. However, end-to-end/integration tests in Flutter are often time-consuming to write, debug and maintain, and much time is wasted. This makes testing not a very pleasant piece of work and it is tempting to skip it (at least for me :( ). Therefore, let us rethink it and try to reduce the time-wasters.

## Ideal vs (old) reality

Let's close our eyes and imagine: What should tests look like in an ideal world? Well, just tell the computer what you expect to happen without wasting a single word. That's all. Then, when tests pass, you are confident; whenever tests fail, it should clearly point out where your business code goes wrong so you can fix it.

However, that was not the reality. In the real world, much more time is spent (read: wasted) on other aspects of tests.

A significant difference between ideal and reality is the time it needs to locate the root cause of a test failure, which may be called (generalized) **debuggability**. On one hand, after writing a test, it is often the case that it fails a few times before it passes, because either your test is buggy or the business code has problems. On the other hand, regression (a test that passed before fails now) happens from time to time, which indicates there are some problems in your updated code. In either case, you need to dig out the root cause to fix it. Therefore, the slow speed of bug locating contributes a lot to wasted time.

Flutter's `integration_test` has, well, non-excellent developer experience for this. Consider a typical scenario: An end-to-end/integration test taps/drags/scrolls many elements, and finally fails at an assertion. Then, how to know which step goes wrong? Let alone such failures can happen inside a CI, where you often only have logs available. One approach may be reading and analyzing the logs - if you have a thorough logging system - but it is still time-wasting because many bugs can be spotted quickly by looking at UI. Carefully observing what the simulator displays is also not a perfect choice, because the taps/drags often happen too quickly, and this is impossible for CI mode. Other details during cause-digging can also waste some time.

There are also other aspects. The lack of **retryability** wastes some time. In end-to-end/integration tests, nondeterministic events, such as network requests, happen quite frequently. You cannot know when it will end exactly. Thus, to avoid flaky tests, the tests have to be written with waits and retries. **Flakiness**, which is natural in end-to-end tests, also causes some false positives. Nobody wants to spend time examining the test "failure", only to realize it is only flaky.

That *was* the real world. Can we do it better?

## The solution

All the headache above leads me to write the open-source https://github.com/fzyzcjy/flutter_convenient_test. With the package, the time-wasting processes mentioned above are reduced to a minimum. Surely it is not perfect (and young - only a few weeks old), but I hope my small step could help you save some time as well as inspire other time-saving solutions.

It is built on top of `integration_test`, so you can still use your favorite packages like `integration_test`, `mockito`, `test`, etc, and migrate to this library with minor modifications.

Debuggability is strongly enhanced, mainly with the following features. All these are also applicable when running in CI - it will generate a data pack and you can visualize it later on your desktop.

Firstly, you can view all actions/assertions taken in the tests, with friendly descriptions.

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/a_action_history.gif)

Next, you can do time traveling with screenshots. What did the UI look like when that button was tapped even 50 steps ago? Now you know everything.

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/b_time_travel_screenshot.gif)

Want to see it live instead of screenshots? No problem - you have the video records.

![](https://raw.githubusercontent.com/fzyzcjy/flutter_convenient_test/master/doc/gif/d_video_record.gif)

Debuggability is also enhanced via other functionalities. For example, you can switch the mode and play with the app interactively, even if you are running tests. This was impossible in the era of `integration_test`, and you had to make a full restart for that. As another example, after modifying the code, tests can be re-executed within seconds, not minutes. As smaller examples, screen operations now have visual feedback in videos, and a single test or single group can be run within a click now.

Some time-wasting aspects are reduced to zero-second jobs: For retryability, this package automatically inserts `pump` and retries whenever appropriate, so there is completely zero need for humans to intervene and write code. When it comes to flakiness, the library fully understands it and will neither wrongly view it as failed (and maybe a big red error in CI) nor consider it as succeeded.



Here is a 1-minute video as well:

https://user-images.githubusercontent.com/5236035/167066810-d0aa36ba-0113-4140-92f9-cec0a9e77ed1.mov

(Or, YouTube link: https://www.youtube.com/watch?v=z-Hr_TSOpUQ)



---



##### Short description of the blog

Testing is of critical importance, but it has been time-consuming, especially for end-to-end/integration tests. In this blog, we discuss where the time is wasted, including time to locate bug causes, lack of retryability, and flakiness. We then demonstrate an open-source solution (https://github.com/fzyzcjy/flutter_convenient_test) to the problem. (Disclaimer: I wrote that package, but this is a blog about why and how to reduce time-wasting, instead of an ad saying the package is so awesome.)