# Testing in Flutter: It could have taken much less time and efforts

End-to-end or integrations tests are often time-consuming to write, debug and maintain. It is time to change. That is what I have done recently - the open-sourced https://github.com/fzyzcjy/flutter_convenient_test.

TODO

## Where my time goes?

Before saving time, we need to know where our time goes when writing and maintaining tests.

TODO

In an imaginary world, ..., write test like speaking, then it runs within one go (no debug), then it always passes if really should pass (no flaky tests), and when it fails (regression) we should spot the bug in seconds.

But the reality...

Thus I do the package...

### Day 0: Write tests

Debuggability

retryability

TODO

### Day 1: Maintain tests

Regression - debuggability

Flaky

TODO

### Core issue: Debuggability

Since nobody can always write passing tests in one go, and regressions happen from time to time, it is critical to ensure tests 

For example, an e2e test may tap/drag/assert a lot of things. When an assertion fails, it is usually 

how will you spot the root cause of failure in a few seconds? 

for an e2e test that taps, drags, and asserts a ton of things, when it fails, I cannot know easily what indeed causes the failure. It may be caused by misbehavior that happens 10 steps ago.

## How to save time?

[TODO]

debuggability -> action history + time travel + screenshots + rapid-re-execution + videos recorded + interactive

