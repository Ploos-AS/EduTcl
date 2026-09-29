# 15 — Logging

Logs should explain bot behavior without becoming a secret store.

Useful events include module startup/shutdown, recoverable failures, denied administrative actions and external-service failures.

Avoid logging passwords, authentication tokens, private-message bodies by default, or unnecessary personal data.

## Structured thinking

Even if the final Eggdrop log API is textual, decide first what happened, severity/context, and what data is safe to include.

A debug mode is not permission to leak secrets.
