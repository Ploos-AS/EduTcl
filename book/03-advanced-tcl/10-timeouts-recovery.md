# 10 — Timeouts and Failure Recovery

Every external wait needs a policy.

A timeout is not merely a timer. It is a transition in the component's state machine.

For a connection attempt:

1. enter `connecting`;
2. start connection and timeout;
3. success cancels timeout;
4. timeout cancels/ closes connection;
5. failure cancels timeout;
6. exactly one terminal outcome is reported.

## Idempotent cleanup

Cleanup should tolerate being called after partial initialization and should avoid double-closing resources.

## Retry carefully

Retries need bounds and usually delay/backoff. Immediate unlimited retries can amplify an outage into a local resource problem.

## Error classification

Do not hide all failures behind "network error." Preserve enough structured information to distinguish timeout, connection refusal, EOF and application/protocol errors.

## Testing

Failure paths are first-class tests. Use local servers, intentionally closed local ports where appropriate, and short bounded timers. Never make the test suite depend on a public host being reachable.

## Bot relevance

IRC bots live on unreliable networks. Correct reconnection begins with explicit lifecycle, timeout ownership and bounded retry behavior—not a loop that reconnects forever as fast as possible.

## Mastery

Draw the state transitions for connect, timeout, failure, EOF and explicit shutdown and identify which transition owns each cleanup action.
