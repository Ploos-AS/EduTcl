# M4 Lab — Registration and Messages

## A — Serializer

Implement a structured serializer and verify it rejects CR/LF in:

- command;
- middle parameter;
- trailing parameter.

Test an empty trailing parameter separately from no trailing parameter.

## B — Registration

Generate NICK and USER logical lines from structured configuration.

Do not include passwords or real credentials.

## C — PING/PONG

Parse a PING and create the corresponding PONG using the serializer.

Verify a Tcl-looking token remains inert.

## D — PRIVMSG

For channel and direct messages, produce a structured context containing:

- sender;
- target;
- text;
- reply target.

Do not execute command text.

## E — Membership

Feed a sequence of JOIN, NICK, PART and QUIT events into a small state dictionary. Predict state before running each event.

## F — Injection test

Attempt to place `\r\nOPER ...` or another second IRC command inside outbound user-controlled text. The serializer must reject it rather than emitting two lines.

## Exit criteria

You can safely move from structured values to one outbound IRC message and can explain the connection-state effects of registration and common user/channel events.
