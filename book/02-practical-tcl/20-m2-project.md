# 20 — M2 Project: Modular MiniBot

Refactor or rebuild MiniBot as a reusable multi-file Tcl application.

## Required modules

The project must have explicit ownership for configuration, command registry, runtime state, command implementations, and transport adaptation.

## Required techniques

Use namespaces, packages or clearly justified source boundaries, command prefixes, `{*}`, structured errors, `try/finally`, explicit channel configuration where relevant, and `tcltest`.

## Required behaviors

Support registration and invocation of commands, help metadata, state counters, save/load, configuration validation, and graceful handling of unknown commands.

## Security qualification

User values containing Tcl-looking syntax must remain data. Configuration execution boundaries must be documented. Public errors must not accidentally expose internal diagnostics.

## Failure qualification

Test missing/corrupt persistence, duplicate registrations, invalid configuration, callback failures, and cleanup after errors.

## Written assessment

Explain module ownership, dependency direction, callback representation, error hierarchy, configuration trust, test isolation, and which adapter will eventually be replaced by Eggdrop.

## Exit criterion

The learner can add a new command as a module-level behavior, register it, test it, and explain the full path from input adapter to result without hidden evaluation.
