namespace eval ::miniirc::outbox { variable q {}; variable limit 16 }
proc ::miniirc::outbox::reset {{n 16}} { variable q; variable limit; if {![string is integer -strict $n] || $n < 1} {return -code error -errorcode {MINIIRC OUTBOX LIMIT} "invalid outbox limit"}; set q {}; set limit $n }
proc ::miniirc::outbox::put {line} { variable q; variable limit; if {[llength $q] >= $limit} {return -code error -errorcode {MINIIRC OUTBOX FULL} "outbox is full"}; lappend q $line; return [llength $q] }
proc ::miniirc::outbox::get {} { variable q; if {![llength $q]} {return -code error -errorcode {MINIIRC OUTBOX EMPTY} "outbox is empty"}; set x [lindex $q 0]; set q [lrange $q 1 end]; return $x }
proc ::miniirc::outbox::size {} { variable q; llength $q }
