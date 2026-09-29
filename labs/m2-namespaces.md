# M2 Lab — Namespace-owned command registry

Build a small command registry without Eggdrop.

## Requirements

Create a namespace that owns a dictionary mapping command names to descriptions. Expose procedures to register a command, test whether a command exists, list registered commands, and retrieve a description.

Do not require callers to access the namespace variable directly.

## Qualification

Test:

- an empty registry;
- multiple commands;
- duplicate registration according to a policy you define;
- command names containing unusual but valid data;
- deterministic listing;
- resetting state between tests.

## Reflection

Explain the difference between global variables, namespace variables, and procedure-local variables. Then explain why a namespace is organizational structure rather than a security boundary.
