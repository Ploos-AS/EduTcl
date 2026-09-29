# 23 — API Error Handling

Errors need policy at boundaries.

Classify failures into useful categories:

- invalid caller input;
- authorization denial;
- unavailable capability;
- temporary external failure;
- exhausted resource;
- programming/invariant error.

Do not turn every error into the same public message. Operators may need diagnostic context that users should not receive.

Cleanup must still run when an operation fails.
