# 16 — Configuration patterns

Configuration is input and deserves an explicit contract.

## Separate configuration from state

Configuration describes intended behavior. Runtime state describes what has happened. Mixing them makes reloads, persistence, and tests confusing.

## Dictionary configuration

A dictionary is convenient for small structured configurations:

```tcl
set config [dict create prefix ! logLevel info]
```

Validate required keys and values at a boundary.

## Defaults

Apply defaults deliberately rather than scattering fallback values throughout the program.

## Tcl as configuration

A Tcl script can itself be a configuration language, but sourcing configuration executes code. That may be appropriate for trusted operator-controlled files and inappropriate for untrusted input.

## Secrets

Do not commit credentials or tokens to the repository. Later production chapters cover environment, permissions, secret stores, and deployment-specific configuration.

## Exercise

Define a configuration schema for MiniBot with defaults, validation, and structured errors. Keep runtime counters out of it.
