# 29 — Integration Checklist

Before enabling an Eggdrop Tcl module on a real bot, verify:

- required commands/capabilities exist;
- callback signatures match the target Eggdrop release;
- binds are registered once and removed on shutdown;
- flags mean what the module assumes;
- output queue policy is appropriate;
- timers and async work are bounded and cancellable;
- filesystem roots are explicit;
- secrets are absent from normal logs;
- reload is safe;
- malformed IRC/DCC/botnet input cannot become Tcl code.

Mock tests and real-host integration tests answer different questions. Keep both.
