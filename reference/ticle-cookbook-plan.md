# TiCle Cookbook Plan

EduTcl should produce bot features that are useful beyond the classroom.

TiCle is maintained as a separate repository. EduTcl teaches patterns and develops examples; suitable mature examples may later become TiCle modules through normal TiCle development and review.

## Progression

Each substantial feature should, where useful, be shown in three contexts:

1. plain Tcl mechanism;
2. Eggdrop implementation;
3. TiCle implementation using TiCle's actual API.

Do not force all examples into all three environments when the mapping is artificial.

## Cookbook candidates

### Core utility

- help and command discovery
- about/version/uptime
- diagnostics and health
- aliases and subcommands
- per-command cooldowns
- rate limiting

### Community

- seen
- quotes
- karma
- notes
- reminders
- channel statistics
- activity summaries

### Information

- URL title/info
- RSS/Atom watcher
- weather/API adapter
- WHOIS/user information
- time/timezone helpers

### Operations

- logging
- metrics
- module status
- controlled reload
- configuration inspection without secret disclosure

### Administration

- privilege-aware channel helpers
- allow/deny policy examples
- audit logging
- bounded moderation helpers

### Advanced integration

- persistent state
- module dependencies
- safe-interpreter experiments
- PBMP adapter
- optional BotAI integration
- optional BotWeb integration

## Quality bar

A cookbook module should demonstrate:

- documented commands;
- input validation;
- privilege model where relevant;
- rate/resource limits;
- structured state;
- clean init/shutdown;
- tests;
- Unicode handling;
- no accidental data-to-code evaluation;
- failure behavior for unavailable external services.

## Principle

A cool example should teach something important **and** make the bot more useful.
