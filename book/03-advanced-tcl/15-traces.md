# 15 — Traces and Observable State

Tcl can invoke callbacks when commands or variables are used or changed. Variable traces are useful for carefully chosen observation and integration points.

```tcl
proc changed {name1 name2 op} {
    puts "state changed"
}

trace add variable ::app::state write changed
```

Remove what you add:

```tcl
trace remove variable ::app::state write changed
```

## Hidden control flow

Traces can make a simple assignment execute surprising extra behavior. That power should be used sparingly.

Prefer an explicit procedure when changing state is an important domain operation:

```tcl
::connection::transition connected
```

That is usually clearer than making every write to a variable secretly perform lifecycle work.

## Good uses

Traces can be appropriate for diagnostics, compatibility layers, observation and narrowly scoped synchronization.

## Reentrancy

Trace callbacks can interact with the state they observe. Understand reentrancy and avoid recursive side effects.

## Security

A trace is executable behavior attached to apparently ordinary operations. Treat installation of traces as code-level capability, not as harmless metadata.

## Mastery

Give one situation where a trace improves observability and one where an explicit API is safer and clearer.
