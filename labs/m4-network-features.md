# M4 Lab — Network Features and CTCP

## A — MODE

Separate generic IRC parsing from command-specific mode interpretation. Document what network information is needed before interpreting all mode parameters.

## B — Multi-reply query

Design a WHOIS collector as a state machine. It must not block the Tcl event loop while waiting for the terminating numeric.

## C — ISUPPORT

Parse flag/presence, key/value and removal tokens and store them per IRC connection.

## D — Casemapping

Create dictionary keys for nicknames under ASCII, strict-rfc1459 and rfc1459. Test punctuation, not just A-Z.

## E — CTCP

Decode ACTION and VERSION examples. Add malformed inputs and ordinary messages. Do not automatically disclose OS, hostname, filesystem paths or unnecessary runtime information.

## F — Architecture review

For MODE, WHOIS, ISUPPORT, casemapping and CTCP, identify which layer owns syntax, connection/network state, bot policy and user-visible response.

## Exit criteria

You can explain why IRC behavior depends on discovered network properties and keep those properties out of unrelated command modules.
