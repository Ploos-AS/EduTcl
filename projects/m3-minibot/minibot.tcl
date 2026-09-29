set here [file dirname [file normalize [info script]]]
foreach f {queue.tcl registry.tcl timers.tcl core.tcl commands.tcl} { source [file join $here lib $f] }
::minibot::commands::install
