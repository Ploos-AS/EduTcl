# 21 — Error Containment

A failed command should not corrupt module state or turn one bad request into repeated failures.

Validate before mutation. Keep cleanup paths explicit. Give errors enough context for operators without echoing secrets.

External input can trigger ordinary errors. That is not exceptional from the bot's point of view; it is part of the runtime environment.

## Boundary

Catch errors where you can add policy: callback boundary, external service boundary, persistence boundary or lifecycle boundary. Do not hide every programming error with a blanket catch.
