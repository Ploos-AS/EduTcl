# 16 — DCC Chat and Console

Administrative consoles are powerful because they operate close to the bot's control plane.

Keep administrative operations narrow and privilege-checked. Prefer purpose-built commands over generic execution facilities.

For teaching and automated tests, model the operation as an ordinary Tcl service first. The DCC callback should be a thin adapter.

Never place real operator passwords or credentials in course fixtures.
