# M4 Lab — IRC Parser Basics

## Part A — Predict

For each line, identify prefix, command and logical parameter list before running code:

```text
PING :server.example
:n!u@h PRIVMSG #tcl :hello world
:server.example 001 EduBot :Welcome
NOTICE EduBot :
JOIN #tcl
```

## Part B — Parse

Implement the chapter parser contract.

Do not use `eval`. Do not interpret PRIVMSG semantics yet.

## Part C — Adversarial values

Verify Tcl-looking text remains ordinary data:

```text
:n!u@h PRIVMSG #tcl :$name [error BOOM] ; puts BAD
```

## Part D — Malformed input

Test at least:

- empty input;
- prefix with no command;
- embedded CR;
- embedded LF.

Errors must be observable.

## Part E — Layering

Write down which component owns:

- TCP reads;
- CRLF framing;
- generic IRC parsing;
- PRIVMSG interpretation;
- command authorization.

## Exit criteria

You can parse raw lines into dictionaries without coupling the parser to sockets, Tcl execution or bot commands.
