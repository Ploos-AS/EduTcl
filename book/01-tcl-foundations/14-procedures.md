# 14 — Procedures

Procedures let us name reusable behavior.

```tcl
proc greet {nick} {
    return "Hello, $nick"
}

puts [greet Alice]
```

The command `proc` creates a new Tcl command. After the definition, `greet` participates in Tcl's command model just like other commands.

## Keep logic separate from output

Compare:

```tcl
proc greeting {nick} {
    return "Hello, $nick"
}

puts [greeting Alice]
```

with a procedure that always prints directly. Returning a value is often easier to test and reuse.

## Local variables

Variables created inside a procedure are normally local:

```tcl
proc demo {} {
    set value local
    return $value
}
```

This is a feature, not an inconvenience. Small, explicit scopes make bot code easier to reason about.

## Naming

Choose procedure names that describe behavior. As the project grows we will introduce namespaces, which are preferable to inventing long global prefixes.

## Eggdrop connection

Eggdrop `bind` callbacks are Tcl procedures with callback signatures determined by the bind type. Learning to write small procedures with explicit inputs and results is therefore direct preparation for Eggdrop.

## TiCle connection

TiCle's higher-level architecture should keep core logic separable from the thin procedures that adapt Eggdrop events into application calls.
