# 28 — Useful Module: Channel Toolkit

The M6 reference project combines the API lessons into a small channel toolkit.

Features:

- channel topic-note metadata owned by the module;
- bounded per-channel entries;
- member-count query from host state;
- operator-protected clear;
- explicit capability/status report;
- safe bounded replies.

It deliberately avoids persistence; M7 owns that problem.

The project is split into a service core and a host-facing adapter so the core remains deterministic.
