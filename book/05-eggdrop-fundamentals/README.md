# M5 — Eggdrop Fundamentals

M4 made IRC explicit. M5 learns what Eggdrop does for a Tcl script.

## Goal

By the end of M5 you can write, load, test and reason about a small Eggdrop Tcl script without confusing Eggdrop callbacks with the underlying IRC protocol.

## Chapters

1. Eggdrop architecture
2. From MiniIRC to Eggdrop
3. Tcl inside Eggdrop
4. Configuration and script loading
5. The bind model
6. Public command binds
7. Private-message binds
8. Join, part and sign events
9. Nick events
10. Raw binds
11. Callback contracts
12. Masks and flags
13. Output with putserv
14. puthelp and putquick
15. Logging
16. Bot identity and channel context
17. Users, handles and hostmasks
18. Channel state
19. Timers and lifecycle
20. Namespaces and module structure
21. Error containment
22. Testing without an IRC network
23. First useful Eggdrop module
24. Security review
25. M5 project and assessment

## Principle

Eggdrop is an abstraction layer, not magic.

For every important Eggdrop API, ask:

1. Which IRC event or bot operation does this represent?
2. Which arguments are trusted?
3. Who owns state and lifecycle?
4. What happens if the callback fails?

## Qualification

M5 examples should run against the educational mock with ordinary Tcl. A later qualification layer may additionally run selected scripts against a real Eggdrop runtime.
