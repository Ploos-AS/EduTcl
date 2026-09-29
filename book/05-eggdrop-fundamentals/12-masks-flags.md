# 12 — Masks and Flags

A bind has both an event pattern and a flag requirement.

They solve different problems:

- the mask selects an event/command;
- flags constrain who may invoke it.

Do not replace flag checks with nickname comparisons.

## Least privilege

A harmless informational command may need no privilege. Administrative actions should request only the privilege they actually require.

## Mock limitation

MiniEgg models flags only enough to teach authorization flow. It does not reproduce Eggdrop's complete user database or flag matching semantics. Real security qualification must use real Eggdrop behavior.
