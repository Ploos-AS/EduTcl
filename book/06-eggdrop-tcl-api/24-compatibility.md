# 24 — Compatibility and Feature Detection

Host APIs can differ by Eggdrop release, loaded modules and configuration.

Prefer capability detection at startup to scattered version-number comparisons.

A module should state:

- required capabilities;
- optional capabilities;
- degraded behavior;
- unsupported combinations.

A mock command with the same name is not proof of real Eggdrop compatibility. That requires integration qualification.
