# 6 — Building an IRC Parser

Our educational parser returns a dictionary rather than executing callbacks directly.

A useful shape is:

```tcl
dict create \
    raw $line \
    prefix $prefix \
    command $command \
    params $params
```

Derived nick/user/host fields may be added when available.

## Contract

The parser:

- accepts one already-framed logical IRC line;
- rejects CR/LF inside that logical line;
- handles optional prefix;
- preserves unknown commands;
- recognizes trailing parameters;
- returns structured data;
- never evaluates network input.

It does not own sockets, bot authorization or channel state.

## Why a dictionary?

Structured data makes tests and later adapters simple. Eggdrop/TiCle lessons can map their callback arguments or dictionaries to the same conceptual model.

## Failure

Malformed input should produce an observable structured error rather than silently inventing missing fields.

## Mastery

State the parser's trust boundary and list at least three responsibilities that deliberately belong elsewhere.
