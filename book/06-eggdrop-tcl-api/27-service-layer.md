# 27 — Service-Layer Architecture

Separate host calls from application decisions.

```text
Eggdrop callback adapter
 -> command/service layer
 -> module state
 -> host adapter
```

The service layer accepts ordinary Tcl values and returns ordinary Tcl values. This makes authorization, limits and state transitions testable without IRC.

Only the adapter should need to know the exact host API.
