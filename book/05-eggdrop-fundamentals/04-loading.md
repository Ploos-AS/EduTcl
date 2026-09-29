# 4 — Configuration and Script Loading

Eggdrop configuration selects runtime behavior and loads Tcl scripts.

Treat configuration as deployment input, not as a convenient place to hide application logic.

## Repository safety

Do not commit real passwords, operator credentials, server secrets or private keys.

Provide examples with placeholders and document how local secrets are supplied.

## Loading

A script should make initialization explicit and avoid surprising global side effects. Namespaces help prevent collisions between independently loaded scripts.
