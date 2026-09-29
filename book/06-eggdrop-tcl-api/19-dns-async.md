# 19 — DNS and Asynchronous Work

DNS and remote services do not complete on your callback's schedule.

Design asynchronous work with an explicit request identity and lifecycle:

- start;
- timeout/cancel;
- completion;
- stale-result rejection;
- bounded outstanding requests.

A callback may arrive after the user, channel or connection context has changed. Revalidate context before acting on a result.

Never block the event loop waiting indefinitely for DNS or a remote service.
