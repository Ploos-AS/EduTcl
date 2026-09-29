# 24 — Security Review

Review an Eggdrop Tcl module across trust boundaries.

## Input

Treat nick, userhost, channel, command text and raw IRC fields as untrusted network data.

## Code/data

Never use `eval` to execute user-supplied command text.

## Authorization

Use Eggdrop's identity/flag model. Nick equality is not authorization.

## Protocol output

Prevent CR/LF injection when constructing raw IRC lines.

## Resources

Bound stored state, output volume, timers and external requests.

## Secrets and privacy

Keep credentials out of source control and avoid unnecessary retention of user activity.

## Lifecycle

Reload and shutdown must not leave duplicate callbacks, timers or stale state.
