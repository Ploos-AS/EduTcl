namespace eval ::m6host {
    variable bot [dict create connected 0 nick EduBot network testnet]
    variable channels {}
    variable flags {}
    variable timers {}
    variable nextTimer 0
    variable timerLimit 32
}

proc ::m6host::reset {} {
    variable bot; variable channels; variable flags; variable timers; variable nextTimer
    set bot [dict create connected 0 nick EduBot network testnet]
    set channels {}; set flags {}; set timers {}; set nextTimer 0
}

proc ::m6host::set_bot {key value} { variable bot; dict set bot $key $value }
proc ::m6host::bot {key} { variable bot; dict get $bot $key }

proc ::m6host::join {chan nick hand} {
    variable channels
    dict set channels $chan $nick [dict create hand $hand]
}
proc ::m6host::part {chan nick} {
    variable channels
    if {[dict exists $channels $chan $nick]} { dict unset channels $chan $nick }
    if {[dict exists $channels $chan] && ![dict size [dict get $channels $chan]]} { dict unset channels $chan }
}
proc ::m6host::members {chan} {
    variable channels
    if {![dict exists $channels $chan]} { return {} }
    return [dict keys [dict get $channels $chan]]
}

proc ::m6host::set_flags {hand value} { variable flags; dict set flags $hand $value }
proc ::m6host::has_flag {hand flag} {
    variable flags
    expr {[dict exists $flags $hand] && [string first $flag [dict get $flags $hand]] >= 0}
}

proc ::m6host::timer_add {seconds callback} {
    variable timers; variable nextTimer; variable timerLimit
    if {![string is integer -strict $seconds] || $seconds < 0} {
        return -code error -errorcode {M6 TIMER DELAY} "invalid timer delay"
    }
    if {[dict size $timers] >= $timerLimit} {
        return -code error -errorcode {M6 TIMER FULL} "timer limit reached"
    }
    incr nextTimer
    set id "t$nextTimer"
    dict set timers $id [dict create seconds $seconds callback $callback]
    return $id
}
proc ::m6host::timer_cancel {id} {
    variable timers
    if {[dict exists $timers $id]} { dict unset timers $id; return 1 }
    return 0
}
proc ::m6host::timers {} { variable timers; return $timers }

::m6host::reset
