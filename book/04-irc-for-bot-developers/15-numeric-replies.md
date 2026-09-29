# 15 — Numeric Replies

Servers use three-digit numeric command tokens for many replies and errors. A generic parser should preserve the numeric token exactly.

A semantic layer may map selected numerics to registration progress, query data/end markers, nickname errors and channel errors.

## Do not invent success from silence

Registration, joins and queries have server-observable outcomes. Model relevant success/error replies instead of assuming a sent command succeeded.

Unknown numerics should remain observable and loggable. Forward-compatible clients tolerate extensions they do not yet interpret.

Classic IRC does not always provide a modern request ID. Correlating multi-reply operations may require command-specific state.

## Mastery

Explain the difference between parsing numeric `001` and deciding what `001` means to the connection state machine.
