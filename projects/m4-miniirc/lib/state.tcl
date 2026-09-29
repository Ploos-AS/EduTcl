namespace eval ::miniirc::state { variable phase disconnected; variable nick ""; variable channels {}; variable synchronized 0 }
proc ::miniirc::state::reset {} { variable phase; variable nick; variable channels; variable synchronized; set phase disconnected; set nick ""; set channels {}; set synchronized 0 }
proc ::miniirc::state::phase {} { variable phase; return $phase }
proc ::miniirc::state::connect {} { variable phase; set phase registering }
proc ::miniirc::state::online {n} { variable phase; variable nick; variable synchronized; set phase online; set nick $n; set synchronized 1 }
proc ::miniirc::state::join {channel} { variable channels; dict set channels [::miniirc::network::casefold $channel] $channel }
proc ::miniirc::state::disconnect {} { variable phase; variable channels; variable synchronized; set phase disconnected; set channels {}; set synchronized 0 }
proc ::miniirc::state::snapshot {} { variable phase; variable nick; variable channels; variable synchronized; dict create phase $phase nick $nick channels $channels synchronized $synchronized }
