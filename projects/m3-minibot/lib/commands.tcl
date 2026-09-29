namespace eval ::minibot::commands {}
proc ::minibot::commands::about {args} { return "MiniBot M3 - event-driven Tcl bot core" }
proc ::minibot::commands::uptime {args} { return "uptime-ms [::minibot::core::uptime]" }
proc ::minibot::commands::status {args} { return [dict create state [::minibot::core::state] queued [::minibot::queue::size] timers [::minibot::timers::count]] }
proc ::minibot::commands::echo {args} { return [join $args " "] }
proc ::minibot::commands::remind {ms args} { if {![llength $args]} {return -code error -errorcode {MINIBOT REMIND MESSAGE} "missing reminder message"}; set text [join $args " "]; set token [::minibot::timers::schedule $ms [list ::minibot::core::emit "reminder: $text"]]; return "reminder $token scheduled" }
proc ::minibot::commands::install {} { ::minibot::registry::reset; foreach {name prefix} {about ::minibot::commands::about uptime ::minibot::commands::uptime status ::minibot::commands::status echo ::minibot::commands::echo remind ::minibot::commands::remind} {::minibot::registry::bind $name $prefix} }
