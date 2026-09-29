# 1 — The Tcl Event Loop

## Objectives

After this chapter you should be able to explain:

- what an event loop is;
- why callbacks run only when Tcl processes events;
- why event-driven programs must return control instead of blocking;
- how this model prepares us for Eggdrop.

## From sequential to event-driven

Most programs so far have looked like this:

```tcl
set name Alice
puts "Hello, $name"
puts "Done"
```

Each command finishes before the next command runs.

A bot cannot spend its life waiting inside one operation. It may need to react to network input, timers and other events. Tcl therefore has an event system that can wait for events and invoke registered callbacks.

The important mental model is:

1. register future work;
2. return control;
3. let Tcl process events;
4. Tcl invokes the appropriate callback.

## Callbacks are commands

A callback should normally be represented as a command prefix:

```tcl
proc announce {message} {
    puts $message
}

set callback [list announce "timer fired"]
```

The list is data describing a command invocation. We do not build Tcl source text and later `eval` it.

## An event must be serviced

Scheduling work does not mean it immediately runs:

```tcl
after 100 {puts "later"}
puts "now"
```

A short script can terminate before a future event is serviced. Event-driven applications therefore have a lifecycle that keeps the interpreter alive while events are relevant.

We will use `vwait` shortly to demonstrate this explicitly.

## Do not block the event loop

A long blocking operation prevents other callbacks from running. This matters enormously in bots: while one handler blocks, timers and network events may be delayed.

The goal is not merely "use callbacks." The goal is to split work so Tcl can regain control between events.

## Eggdrop connection

Later, Eggdrop will own much of the process lifecycle and invoke Tcl handlers when IRC and bot events occur. The underlying idea is already visible here: register behavior and return.

Learning the Tcl model first makes Eggdrop bindings much less mysterious.

## Security note

An event callback is an execution boundary. Keep untrusted input as arguments/data:

```tcl
set callback [list handle_message $untrusted]
```

Do not turn network text into a script.

## Mastery check

You should be able to explain why registering a callback and executing a callback are different operations, and why a blocking callback can affect unrelated bot activity.
