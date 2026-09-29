# 21 — Bot Links and Messages

Cross-bot commands need a small protocol.

Prefer versioned, structured messages with explicit verbs over free-form Tcl fragments.

Example conceptual envelope:

```text
version 1
verb status
request-id 42
payload ...
```

Unknown versions and verbs should fail closed. Never evaluate a remote payload as Tcl source.

Make duplicate or late replies harmless where possible.
