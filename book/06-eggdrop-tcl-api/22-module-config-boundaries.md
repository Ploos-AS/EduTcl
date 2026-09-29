# 22 — Module and Configuration Boundaries

Configuration is input, even when it comes from an administrator.

Validate configuration once at startup and expose normalized values to the rest of the module.

Separate ordinary settings from secrets. Avoid APIs that dump an entire configuration dictionary into logs or IRC.

Optional integrations should be disabled cleanly when their required configuration or host capability is absent.
