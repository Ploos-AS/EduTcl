# EduTcl Pedagogy

EduTcl assumes no prior Tcl, Eggdrop, IRC bot, or software engineering experience.

The course is deliberately cumulative. Concepts introduced in plain Tcl are reused in Eggdrop, then reused again in TiCle.

## Learning model

Each substantial chapter should contain:

1. learning objectives;
2. explanation from first principles;
3. minimal standalone Tcl example where possible;
4. Eggdrop-specific application;
5. common mistakes and debugging notes;
6. security implications where relevant;
7. exercises;
8. a practical lab;
9. a TiCle connection or extension where appropriate;
10. a short mastery checklist.

## Exercise levels

Exercises are grouped by difficulty:

- **Foundation** — verifies the chapter's core idea.
- **Practice** — applies the idea to a realistic Eggdrop problem.
- **TiCle** — connects the topic to TiCle architecture or module development.
- **Expert** — open-ended design, review, debugging, performance, or security work.

## Progression

The reader progresses through four competence stages:

### Stage A — Beginner

Can run Tcl, understand basic evaluation, write procedures and simple Eggdrop commands.

### Stage B — Independent Eggdrop developer

Can create useful multi-feature Eggdrop scripts, use binds correctly, manage bot state, debug problems, and integrate external services.

### Stage C — Advanced bot engineer

Can design modular systems, persistence, testing, secure interfaces, robust event handling, botnets, and production deployments.

### Stage D — Expert Tcl/Eggdrop/TiCle developer

Can reason precisely about Tcl evaluation, review unfamiliar code, diagnose subtle bugs, design stable APIs, audit security, profile performance, refactor legacy systems, extend TiCle safely, and make architectural trade-offs in large bot systems.

## TiCle's role

TiCle is maintained in its own repository. EduTcl does not duplicate TiCle's source tree.

Instead, TiCle is used in three ways:

- small examples demonstrate how a concept appears in a real bot;
- advanced chapters study selected TiCle architecture and APIs;
- labs and capstones require the learner to design or implement TiCle-compatible modules and extensions.

Where a TiCle detail is version-sensitive, the course must state the expected TiCle version or commit range.

## Tcl before magic

Eggdrop conveniences must never hide Tcl fundamentals. A learner should understand why a callback works, how Tcl parsed its arguments, where scope comes from, and what input is trusted or untrusted.

## Security throughout

Security is not isolated to one chapter. Topics such as substitution, `eval`, `exec`, file paths, IRC input, permissions, secrets, resource exhaustion, and plugin boundaries should be called out when first encountered and revisited in the dedicated security section.

## Mastery standard

Completion is not defined as merely reading all chapters. The expert track requires successful capstone work involving:

- a production-grade Eggdrop/TiCle extension;
- automated tests;
- documentation;
- failure and recovery analysis;
- security review;
- debugging of intentionally flawed Tcl/Eggdrop code;
- architectural explanation of the resulting system.
