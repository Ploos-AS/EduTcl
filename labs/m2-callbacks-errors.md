# M2 Lab — Safe callback registry

Build a namespace-owned callback registry.

## Registry

Store command prefixes as Tcl list values. Expose operations to register, remove, inspect, and invoke callbacks.

Do not store callbacks as source-code strings.

## Invocation

Use `{*}` to invoke a registered command prefix with event arguments.

Test event values containing spaces, Unicode, dollar signs, brackets, semicolons, braces, and backslashes.

## Errors

Define a structured error-code hierarchy for:

- unknown callback;
- duplicate registration;
- invalid registry operation;
- callback failure.

Use `try`/`trap` where a caller can meaningfully recover. Preserve unexpected errors rather than disguising them.

## Cleanup

Add one operation that uses a file or other channel and prove with a test that cleanup occurs on failure.

## Reflection

Explain why a command prefix is data describing a command invocation but is safer and easier to compose than constructing Tcl source text.
