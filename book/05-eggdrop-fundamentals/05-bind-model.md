# 5 — The Bind Model

A bind connects an Eggdrop event pattern to a Tcl callback.

Conceptually:

```text
IRC/network event
      |
 Eggdrop core
      |
 bind match
      |
 Tcl callback
```

The callback signature depends on the bind type.

## Important distinction

The callback's text argument is data. Do not turn it into Tcl code with eval.

## Testability

M5 provides an educational mock that records binds and can dispatch a small supported subset. It is not an Eggdrop replacement; it is a deterministic teaching tool.
