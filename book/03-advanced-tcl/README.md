# M3 — Advanced Tcl

M3 moves from conventional Tcl programs to the event-driven and extensible programming model needed for serious bot development.

The central transition is:

> Do not wait for work. Register what should happen, return to the event loop, and react when the event arrives.

This milestone remains runnable in plain Tcl. Eggdrop-specific commands are intentionally deferred, so students understand the Tcl mechanisms before Eggdrop adds its API.

## Chapters

1. The Tcl event loop
2. Timers with `after`
3. Cancellation and timer ownership
4. `vwait` and event-driven programs
5. Channels revisited: blocking vs non-blocking
6. `fileevent` and readable/writable events
7. Building a non-blocking line reader
8. TCP clients with `socket`
9. Asynchronous connection patterns
10. Timeouts and failure recovery
11. State machines
12. Command queues and backpressure
13. Coroutines
14. Generators and cooperative workflows
15. Traces and observable state
16. TclOO fundamentals
17. Objects, classes and lifecycle
18. Mixins and filters
19. Ensembles and API design
20. Interpreters and execution boundaries
21. Safe interpreters: capabilities and limits
22. Dynamic code, `eval`, `uplevel` and `upvar`
23. Performance measurement and profiling
24. Refactoring MiniBot into an event-driven core
25. M3 project and assessment

## Learning outcomes

After M3 the learner should be able to:

- explain Tcl's event loop rather than treating callbacks as magic;
- build timer-driven and I/O-driven programs without blocking the process;
- use `fileevent` and non-blocking channels correctly;
- design explicit state machines and timeout handling;
- use command prefixes for callbacks without constructing code strings;
- use coroutines where they simplify cooperative workflows;
- understand TclOO well enough to read and design object-based Tcl;
- distinguish namespaces, objects, interpreters and security boundaries;
- explain why a safe interpreter is useful but not automatically a complete sandbox;
- recognize dangerous dynamic evaluation boundaries;
- measure before optimizing;
- build and test an event-driven MiniBot core.

## Security thread

M3 treats every asynchronous boundary as a correctness and security boundary. Particular attention is given to:

- untrusted network input;
- bounded buffers and message sizes;
- timeout ownership;
- callback lifetime;
- resource cleanup;
- denial-of-service resistance;
- accidental re-evaluation of data;
- interpreter capabilities;
- safe handling of dynamically loaded or configured behavior.

## MiniBot evolution

M1 introduced a small command dispatcher.

M2 separated configuration, state, registry, commands and adapters.

M3 turns that architecture into an event-driven core with timers, asynchronous I/O, explicit lifecycle management and deterministic tests.

This prepares MiniBot for the later IRC and Eggdrop milestones without pretending that stdin is IRC.

## Qualification target

M3 is complete when:

1. all chapter examples run under the supported Tcl baseline;
2. timer and event-loop tests are deterministic;
3. network tests do not depend on public Internet services;
4. resource cleanup is tested;
5. adversarial input remains data;
6. the M3 MiniBot project passes its automated suite;
7. M1 and M2 remain green.
