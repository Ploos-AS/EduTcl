# 18 — Network Helpers

Network calls introduce latency, failure and another trust boundary.

Keep protocol-specific code behind a small service API. Define timeouts and response-size limits. Validate remote data before it reaches IRC output or persistent state.

Do not block the bot's event loop with an unbounded operation.

M6 establishes the boundary; later chapters develop asynchronous DNS/network work and production failure policy.
