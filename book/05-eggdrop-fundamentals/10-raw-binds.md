# 10 — Raw Binds

Raw binds expose lower-level server messages to Tcl.

They are valuable when Eggdrop's higher-level events do not expose what a module genuinely needs. They are not a reason to reimplement the whole IRC parser from M4.

## Prefer the highest useful abstraction

Use a public-command bind for a public command. Use a join bind for joins. Reach for raw only when the lower-level event is actually required.

## Safety

Raw server text remains untrusted protocol input. Preserve data/code separation and bound any state created from it.
