# 22 — Testing Without an IRC Network

Most bot logic does not require a live IRC server.

MiniEgg provides a deterministic teaching seam for binds, selected events, flags, output and state.

## Test pyramid

1. ordinary Tcl functions;
2. callback adapters with MiniEgg;
3. integration tests with a real Eggdrop runtime;
4. optional controlled IRC integration.

Do not make every unit test depend on DNS, an IRC network or timing.

Mocks verify your code's assumptions. They do not prove that the real Eggdrop API behaves identically. That requires separate qualification.
