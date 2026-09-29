# M4 Lab — MiniIRC Capstone

Build the project incrementally.

## 1. Parser/serializer

Create table-driven examples and malformed cases.

## 2. Network model

Apply synthetic 005 tokens and verify CASEMAPPING changes comparisons.

## 3. Connection lifecycle

Drive synthetic connect/register/001/disconnect/reconnect events through explicit states.

## 4. Outbox

Fill a deliberately tiny queue and verify overload policy. Ensure protocol-critical work has a documented path.

## 5. State recovery

Populate channel state, simulate disconnect, and prove stale state is not presented as current.

## 6. Application bridge

Convert a PRIVMSG dictionary into a command context without evaluating its text.

## 7. Review

For every procedure, identify the layer it belongs to. Refactor procedures that mix transport, protocol and application policy without a clear reason.

## Exit criteria

You can explain and test the complete path from hostile wire input to safe structured bot behavior and back to one bounded outbound IRC line.
