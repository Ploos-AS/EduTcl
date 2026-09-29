# 14 — puthelp and putquick

Eggdrop exposes multiple server-output paths with different scheduling intent.

The important lesson is not to memorize one function as "fast". It is to choose an output class deliberately and let the bot core manage network pacing.

A module should not bypass flood protection merely because its response feels important.

## Design

Wrap output policy:

```text
module logic -> reply helper -> selected Eggdrop output API
```

That gives one place to change queue policy later.

MiniEgg records the selected output API so tests can verify policy without opening a network connection.
