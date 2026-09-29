# M3 Lab — TclOO, Ensembles and Interpreters

## Part A — Connection object

Create a TclOO connection object owning:

- lifecycle state;
- one timer;
- a bounded outbound queue;
- explicit `close`;
- destructor cleanup.

Schedule a callback, destroy or close the object, and prove stale work cannot mutate live state.

## Part B — Ensemble

Build a namespace ensemble for a small configuration store. Export only `get`, `set` and `exists`. Keep validation helpers private.

Explain why this is API design rather than isolation.

## Part C — Safe interpreter

Create a safe child interpreter. Give it one alias:

```text
lookup key
```

The host must enforce an allowlist of keys.

Demonstrate that the child can use the granted capability but cannot simply use hidden raw file access.

## Part D — Capability abuse

Now imagine the host exposes:

```text
read-any-file path
```

Explain why the safe interpreter no longer protects the host's files from code possessing that alias.

## Part E — Resource threat model

Describe how you would handle untrusted code that loops forever or consumes excessive memory. Distinguish Tcl-level command capabilities from stronger process/container resource isolation.

## Exit criteria

You can distinguish namespace, ensemble, object, safe interpreter and OS process boundaries without calling organizational mechanisms security sandboxes.
