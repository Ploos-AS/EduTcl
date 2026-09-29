# 12 — Logging API

Logs are for operators, debugging and audit—not a second database.

Prefer structured context:

- module;
- operation;
- outcome;
- non-secret identifiers.

Do not casually log passwords, tokens, private-message bodies or complete configuration dumps.

Keep user-facing errors and operator diagnostics separate.
