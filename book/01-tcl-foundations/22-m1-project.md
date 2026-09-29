# 22 — M1 Project: MiniBot Core

The M1 capstone is a standalone Tcl command bot. It is deliberately **not** an IRC bot and requires no Eggdrop installation.

## Required behavior

MiniBot reads commands from standard input and supports at least:

- `hello`
- `help`
- `about`
- `count`
- `channels`
- `quit`

The implementation must separate input/output adaptation, command dispatch, command logic, and state.

## Required Tcl concepts

Use procedures, braced expressions, lists, dictionaries or arrays where appropriate, explicit procedure arguments/results, error handling, and basic file I/O.

Do not use `eval` to dispatch user commands. Do not create structured lists by concatenating untrusted values with spaces.

## State

Track at least a command counter and a channel list. Add a simple save/load feature so the learner encounters persistence boundaries.

## Adversarial inputs

Test command arguments containing spaces, dollar signs, square brackets, braces, semicolons, backslashes, empty strings, and Unicode.

These inputs must remain data unless the program intentionally defines otherwise.

## Written assessment

Explain:

1. the evaluation of one non-trivial command line;
2. why user text is not automatically Tcl code;
3. why your list construction is structurally safe;
4. where state lives;
5. where errors are caught;
6. which code can later be reused behind an Eggdrop callback.

## Exit criterion

M1 is complete only when the learner can modify MiniBot without copying a solution and can explain the relevant Tcl evaluation rules.
