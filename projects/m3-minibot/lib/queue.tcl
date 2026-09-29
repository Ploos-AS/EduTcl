namespace eval ::minibot::queue { variable items {}; variable limit 16 }
proc ::minibot::queue::configure {n} { variable limit; if {![string is integer -strict $n] || $n < 1} {return -code error -errorcode {MINIBOT QUEUE LIMIT} "invalid queue limit"}; set limit $n }
proc ::minibot::queue::reset {} { variable items; set items {} }
proc ::minibot::queue::size {} { variable items; llength $items }
proc ::minibot::queue::push {item} { variable items; variable limit; if {[llength $items] >= $limit} {return -code error -errorcode {MINIBOT QUEUE FULL} "event queue is full"}; lappend items $item; llength $items }
proc ::minibot::queue::pop {} { variable items; if {![llength $items]} {return -code error -errorcode {MINIBOT QUEUE EMPTY} "event queue is empty"}; set x [lindex $items 0]; set items [lrange $items 1 end]; return $x }
