namespace eval ::minibot::registry { variable commands {} }
proc ::minibot::registry::reset {} { variable commands; set commands {} }
proc ::minibot::registry::bind {name prefix} { variable commands; set name [string tolower $name]; if {[dict exists $commands $name]} {return -code error -errorcode [list MINIBOT REGISTRY DUPLICATE $name] "duplicate command: $name"}; dict set commands $name $prefix }
proc ::minibot::registry::dispatch {name args} { variable commands; set name [string tolower $name]; if {![dict exists $commands $name]} {return -code error -errorcode [list MINIBOT COMMAND UNKNOWN $name] "unknown command: $name"}; set p [dict get $commands $name]; return [{*}$p {*}$args] }
proc ::minibot::registry::names {} { variable commands; lsort [dict keys $commands] }
