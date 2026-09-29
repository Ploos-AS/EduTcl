# 18 — Practical testing with tcltest

M1 introduced `tcltest`. M2 treats tests as part of module design.

## Arrange, act, assert

A test should make its initial state clear, perform one meaningful behavior, and verify the result.

## Isolation

Reset mutable state between tests. Do not make test 12 pass only because test 11 ran first.

## Test values, not formatting accidents

For structured data, inspect list or dictionary semantics rather than relying on one textual serialization.

## Failure paths

Test expected errors, malformed configuration, missing files, callback failures, cleanup, and recovery—not only successful examples.

## Adversarial data

Bot-oriented libraries should routinely test values containing spaces, Unicode, Tcl metacharacters, empty strings, and unexpectedly long data.

## Tests as documentation

A good test demonstrates the public contract. Tests that depend heavily on private implementation details make refactoring unnecessarily expensive.
