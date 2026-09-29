# M6 — Eggdrop Tcl API

M5 taught the callback model. M6 turns Eggdrop's Tcl surface into a disciplined programming toolkit.

The goal is not command memorization. For every API, ask:

1. What state or service does Eggdrop own?
2. What does the command return?
3. What input is trusted?
4. What failure modes exist?
5. How can the surrounding logic be tested independently?

## Chapters

1. API map
2. Discovering capabilities
3. Bot and server state
4. Channel API
5. Channel member API
6. User database API
7. Handles, hosts and flags
8. User-defined fields
9. Timers
10. UTIMER and scheduling patterns
11. Server output queues
12. Logging API
13. Bind inspection and lifecycle
14. Command dispatch patterns
15. DCC concepts
16. DCC chat and console
17. Files and paths
18. Network helpers
19. DNS and asynchronous work
20. Botnet concepts
21. Bot links and messages
22. Module/configuration boundaries
23. API error handling
24. Compatibility and feature detection
25. Security boundaries
26. Test doubles for Eggdrop APIs
27. Service-layer architecture
28. Useful module: channel toolkit
29. Integration checklist
30. M6 project and assessment

## Qualification rule

Tests against EduTcl mocks prove our Tcl logic. They do not prove compatibility with a particular Eggdrop release. Real Eggdrop qualification is tracked separately.
