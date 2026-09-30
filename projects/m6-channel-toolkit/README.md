# M6 Channel Toolkit

Reference capstone for the Eggdrop Tcl API milestone.

The core is host-independent. The adapter receives a small host command prefix, allowing the same service logic to run against the M6 API Lab or a future real-Eggdrop adapter.

State is in-memory and bounded. Persistence is intentionally deferred to M7.
