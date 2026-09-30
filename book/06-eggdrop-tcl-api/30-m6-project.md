# 30 — M6 Project and Assessment

Build a useful Eggdrop module around a service layer.

## Required

- at least two host API categories;
- explicit capability requirements;
- namespace-owned bounded state;
- privilege-protected mutation;
- safe output;
- explicit init/shutdown;
- tests without IRC;
- integration checklist for a real Eggdrop target;
- security review.

## Explain

Trace a request through callback, authorization, service logic, host API and response.

Explain what the mock proves and what still requires real Eggdrop qualification.

M6 is runtime-qualified only after its Tcl tests pass. Real Eggdrop compatibility remains a separate qualification.
