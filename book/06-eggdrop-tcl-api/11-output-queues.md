# 11 — Server Output Queues

Outbound IRC is a limited resource. Queue choice is policy, not decoration.

Keep message construction separate from queue selection. Normal replies should normally use a normal/flood-aware path; urgent paths should remain exceptional.

Never let untrusted input choose an output primitive or bypass rate policy.

A useful adapter exposes intent such as `reply` or `notice`, rather than spreading raw queue commands throughout business logic.
