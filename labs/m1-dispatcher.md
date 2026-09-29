# M1 Lab — A tiny command dispatcher

This lab is the first architectural bridge toward an IRC bot.

It runs entirely in ordinary Tcl. Eggdrop is not required.

## Goal

Implement procedures for several commands such as `help`, `hello`, and `about`. Write a dispatcher that receives a command name and argument data, normalizes the command name, chooses the appropriate behavior, and returns a response.

## Constraints

- Keep command logic in procedures.
- Pass important input explicitly.
- Avoid mutable global state for the command implementations.
- Treat user-provided text as data.
- Use Tcl list operations for structured list data.
- Use braced expressions and bodies idiomatically.

## Tests by prediction

Before executing each case, record the expected result for:

- a known command;
- an unknown command;
- mixed-case command input;
- surrounding whitespace;
- argument text containing `$`, brackets, braces, and spaces.

## Why this matters

Later Eggdrop callbacks will become adapters: they receive IRC/Eggdrop callback arguments and pass controlled values into logic resembling the code written here.

TiCle will take this separation further with routing, modules, permissions, state, and lifecycle management.
