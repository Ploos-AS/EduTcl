# 2 — Namespaces

Namespaces organize Tcl command and variable names.

```tcl
namespace eval ::greeter {
    proc hello {nick} {
        return "Hello, $nick"
    }
}

puts [::greeter::hello Alice]
```

The fully qualified command name is `::greeter::hello`.

## Why namespaces matter

Two modules can both define a command named `load` without colliding:

```tcl
::config::load
::state::load
```

The names communicate ownership.

## namespace eval

`namespace eval` evaluates a script in a namespace context. It does not create an object or a process; it establishes name resolution context.

## Fully qualified names

A name beginning with `::` is rooted at the global namespace. Being explicit is useful at module boundaries and while learning name resolution.

## Avoid namespace pollution

Do not import every command from every module merely to save typing. Short names are convenient until their origin becomes unclear.

## Exercise

Create `::commands` and `::format` namespaces. Give both a `help` command with different behavior and call each explicitly.
