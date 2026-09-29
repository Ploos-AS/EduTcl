namespace eval ::minibot::timers { variable owned {}; variable serial 0 }
proc ::minibot::timers::schedule {ms callback} { variable owned; variable serial; if {![string is integer -strict $ms] || $ms < 0} {return -code error -errorcode {MINIBOT TIMER DELAY} "invalid timer delay"}; set token [incr serial]; set id [after $ms [list ::minibot::timers::fire $token $callback]]; dict set owned $token $id; return $token }
proc ::minibot::timers::fire {token callback} { variable owned; if {![dict exists $owned $token]} {return}; dict unset owned $token; {*}$callback }
proc ::minibot::timers::cancel {token} { variable owned; if {![dict exists $owned $token]} {return 0}; after cancel [dict get $owned $token]; dict unset owned $token; return 1 }
proc ::minibot::timers::cancel_all {} { variable owned; dict for {token id} $owned {after cancel $id}; set owned {} }
proc ::minibot::timers::count {} { variable owned; dict size $owned }
