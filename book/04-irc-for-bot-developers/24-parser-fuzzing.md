# 24 — Parser Fuzzing and Adversarial Input

Protocol parsers deserve hostile tests.

Start with deterministic adversarial cases before sophisticated fuzzing:

- empty and whitespace-only input;
- missing command;
- malformed prefix;
- many parameters;
- empty trailing parameter;
- very long values;
- embedded CR/LF;
- unusual Unicode in application text;
- unknown commands/numerics/tags;
- Tcl-looking payloads.

## Properties

Useful parser properties include:

- never evaluate input;
- never hang;
- respect configured bounds;
- either return structured data or a structured error;
- serializer emits at most one logical line;
- valid parse/serialize subsets round-trip predictably.

## Reproducibility

A random fuzz failure is useful only if its input can be reproduced. Record seeds or minimized failing cases.

## Mastery

Turn one parser invariant into an automated property-style test.
