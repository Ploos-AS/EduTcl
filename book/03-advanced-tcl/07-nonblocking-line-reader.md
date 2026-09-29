# 7 — Building a Non-Blocking Line Reader

Line protocols are common in bot software, including IRC. This chapter builds the mechanism without pretending that generic lines are IRC messages.

A line reader owns:

- the channel;
- channel configuration;
- the readable callback;
- maximum accepted input;
- EOF/error cleanup;
- a command prefix receiving complete lines.

Keep parsing separate from transport. The reader should deliver a line; another component decides what that line means.

## Bounds

A hostile peer can send data without a newline. Production readers need a size policy. Protocol limits should be enforced at the appropriate layer rather than trusting unlimited input.

## Reentrancy

The line handler may close the channel or change application state. Code after invoking a callback must not blindly assume the old connection still exists.

## Data stays data

Deliver input as an argument:

```tcl
{*}$handler $line
```

Do not concatenate a script from the received text.

## Mastery

Explain why transport, framing and protocol parsing should be separate layers.
