# EduTcl

**Tcl for Eggdrop and TiCle — from zero to expert.**

EduTcl is a complete learning path for Tcl in the context of IRC bot development with Eggdrop and TiCle.

The course starts with no assumed Tcl knowledge and progressively develops the reader from first scripts to advanced Tcl, Eggdrop internals, production bot engineering, security, testing, botnets, plugin architecture, and expert-level TiCle development.

## Goals

A reader who completes EduTcl should be able to:

- understand Tcl's evaluation and substitution model deeply;
- write idiomatic, maintainable Tcl;
- use Tcl's standard library and event-driven facilities;
- understand Eggdrop's Tcl interface and lifecycle;
- build simple and advanced Eggdrop scripts;
- design modular, testable IRC bot systems;
- reason about security boundaries and untrusted IRC input;
- debug and profile Tcl/Eggdrop applications;
- work with linked Eggdrop bots and botnets;
- understand and extend TiCle;
- design and implement TiCle modules/plugins;
- operate Eggdrop/TiCle deployments in production.

## Learning path

1. Tcl from first principles
2. Intermediate Tcl
3. Advanced Tcl
4. IRC fundamentals for bot developers
5. Eggdrop fundamentals
6. Eggdrop Tcl API in depth
7. State, users, channels and persistence
8. Event-driven bot architecture
9. Networking, APIs and integrations
10. Security and defensive programming
11. Testing, debugging and observability
12. Eggdrop botnets and distributed bots
13. Production engineering and operations
14. TiCle architecture and internals
15. TiCle module/plugin development
16. Expert topics and capstone projects

## Repository layout

- `book/` — course/book source
- `labs/` — guided practical exercises
- `examples/` — small focused Tcl/Eggdrop examples
- `projects/` — larger milestone projects
- `reference/` — Tcl, Eggdrop and TiCle reference material
- `docs/` — project and contributor documentation

TiCle remains a separate project/repository. EduTcl uses TiCle as a real-world reference implementation and advanced case study rather than vendoring the bot into this repository.

## Milestones

See [ROADMAP.md](ROADMAP.md).

## M0

M0 establishes the curriculum, repository structure, pedagogical model, scope and long-term roadmap.

## License

Course and documentation licensing will follow the Ploos-AS documentation policy. Source-code examples will have their applicable license documented explicitly before the first release.
