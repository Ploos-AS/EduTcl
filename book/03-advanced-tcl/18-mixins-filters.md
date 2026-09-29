# 18 — Mixins and Filters

TclOO supports composition mechanisms beyond ordinary methods.

## Mixins

A mixin can add behavior to classes or objects without changing their primary inheritance relationship.

Use mixins for genuine cross-cutting behavior, not as a substitute for a clear core API.

## Filters

A filter can intercept method calls. This can support diagnostics, policy checks or instrumentation.

The power comes with hidden control flow: a method call may execute filter behavior before the target method.

## Prefer explicitness

For security-sensitive authorization, make policy visible and testable. A filter can implement policy, but the architecture must document that the filter is mandatory and cannot be bypassed by alternate entry points.

## Composition risks

Deep combinations of inheritance, mixins and filters can make method resolution difficult to reason about. Use `info object`, `info class` and tests to inspect the actual system.

## Mastery

Explain one appropriate use of a mixin and why invisible filter behavior can complicate auditing.
