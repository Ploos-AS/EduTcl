# EduTcl Roadmap

EduTcl takes the reader from zero Tcl knowledge to expert-level Tcl for Eggdrop and TiCle.

## M0 — Foundation

- Define course scope and learning outcomes
- Establish repository structure
- Define pedagogical progression
- Define book/web/reference split
- Define TiCle's role as an external reference implementation
- Establish milestone plan

## M1 — Tcl Foundations

- Tcl execution model
- commands, words and arguments
- substitution
- braces, quotes and brackets
- variables
- expressions
- control flow
- procedures
- scope
- strings and lists
- arrays and dictionaries
- basic error handling
- basic files and channels
- MiniBot capstone
- executable tcltest qualification suite

## M2 — Practical Tcl

- deeper channel configuration and safe resource cleanup
- regular expressions and pattern matching
- namespaces and namespace variables
- packages and package discovery
- structured error options and try/trap/finally
- introspection
- argument expansion and dynamic composition
- functional-style list processing
- configuration patterns
- code organization across files
- reusable libraries
- practical testing patterns

## M3 — Advanced Tcl

- event loop
- timers
- sockets
- callbacks
- apply/lambdas
- coroutines
- ensembles
- TclOO
- metaprogramming
- performance and profiling

## M4 — IRC for Bot Developers

- IRC protocol model
- messages and numerics
- users, channels and modes
- PRIVMSG/NOTICE
- JOIN/PART/QUIT/KICK
- CTCP
- IRCv3 awareness where relevant
- trust boundaries and hostile input

## M5 — Eggdrop Fundamentals

- installing and configuring Eggdrop
- Tcl inside Eggdrop
- script lifecycle
- putlog
- putserv/putquick/puthelp
- bind fundamentals
- first real bot scripts

## M6 — Eggdrop Tcl API

- bind types and callback signatures
- users, handles and flags
- channels and channel state
- masks, bans, invites and exempts
- timers and utimers
- DCC and partyline
- raw server events
- bot lifecycle events

## M7 — Bot State and Persistence

- in-memory state
- Tcl dictionaries and structured state
- files
- serialization
- SQLite integration
- migrations
- caching
- recovery

## M8 — Bot Architecture

- namespaces
- modules
- command dispatch
- event dispatch
- configuration
- structured logging
- dependency boundaries
- plugin architecture
- backwards compatibility

## M9 — Networking and Integrations

- sockets
- HTTP clients
- JSON
- REST APIs
- RSS/Atom
- external services
- retries, timeouts and backoff
- rate limits

## M10 — Security

- Tcl injection
- eval hazards
- exec/shell boundaries
- unsafe substitution
- filesystem safety
- secret handling
- privilege models
- Eggdrop flags
- flood and abuse handling
- resource exhaustion
- secure plugin APIs

## M11 — Testing and Debugging

- interactive debugging
- tracing and introspection
- assertions
- unit testing
- mock Eggdrop API
- event simulation
- integration testing
- regression testing
- CI
- profiling and observability

## M12 — Eggdrop Botnets

- linked bots
- bot communication
- distributed state
- partyline across bots
- topology
- failure handling
- secure inter-bot design

## M13 — Production Operations

- deployment patterns
- systemd
- containers
- upgrades
- backups
- logging
- monitoring
- multi-instance operation
- incident recovery

## M14 — TiCle Architecture

- project architecture
- bootstrap and core
- event system
- command system
- configuration
- persistence
- permissions
- logging
- testing strategy

## M15 — TiCle Development

- module/plugin API
- writing a first TiCle module
- lifecycle
- configuration
- persistence
- permissions
- testing
- packaging
- compatibility

## M16 — Expert Tcl/Eggdrop/TiCle

- advanced Tcl idioms
- sophisticated event-driven design
- scalable bot architecture
- distributed TiCle deployments
- performance work
- security review
- maintaining large Tcl codebases
- reading and reviewing unfamiliar Tcl/Eggdrop code

## M17 — Capstone and Reference Release

- complete production-grade bot project
- advanced TiCle extension project
- comprehensive Tcl reference
- comprehensive Eggdrop Tcl API reference
- TiCle developer reference
- troubleshooting handbook
- final book/web release
