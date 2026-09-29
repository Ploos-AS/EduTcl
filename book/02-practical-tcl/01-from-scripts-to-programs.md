# 1 — From scripts to programs

A small Tcl script can live in one file and a few global variables. A maintainable bot cannot remain that way indefinitely.

M2 introduces boundaries.

## Separate responsibilities

A useful decomposition might be:

```text
main program
  |
  +-- configuration
  +-- command routing
  +-- application state
  +-- persistence
  +-- adapters
  +-- tests
```

These are responsibilities, not necessarily one file each.

## Explicit ownership

Ask of every mutable value:

- Who owns it?
- Who may modify it?
- How does other code access it?
- Can the owner be tested independently?
- What happens when an operation fails?

## APIs before files

Splitting a tangled program into twenty files does not create architecture. First identify commands and data that form a coherent interface; then decide how to package them.

## MiniBot

M1's MiniBot already used a namespace as a preview. During M2 we will refactor that implementation into components and explain every mechanism that M1 intentionally used ahead of schedule.

## Eggdrop and TiCle direction

Eventually Eggdrop should be an adapter around application behavior rather than the place where every concern is mixed together. This principle will become central when we study TiCle.
