namespace eval ::m6host {
    variable bot [dict create connected 0 nick EduBot network testnet]
    variable channels {}
    variable flags {}
    variable timers {}
    variable nextTimer 0
    variable timerLimit 32
    variable output {}
    variable logs {}
    variable ownedBinds {}
    variable capabilities {}
    variable requests {}
    variable nextRequest 0
    variable requestLimit 16
}

proc ::m6host::reset {} {
    variable bot; variable channels; variable flags; variable timers; variable nextTimer
    variable output; variable logs; variable ownedBinds
    variable capabilities; variable requests; variable nextRequest
    set bot [dict create connected 0 nick EduBot network testnet]
    set channels {}; set flags {}; set timers {}; set nextTimer 0
    set output {}; set logs {}; set ownedBinds {}
    set capabilities {}; set requests {}; set nextRequest 0
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

proc ::m6host::send {queue target text} {
    variable output
    if {$queue ni {normal help quick}} {
        return -code error -errorcode {M6 OUTPUT QUEUE} "unknown output queue"
    }
    if {[regexp {[\r\n\x00]} "$target$text"]} {
        return -code error -errorcode {M6 OUTPUT UNSAFE} "unsafe IRC output"
    }
    if {[string length $text] > 300} {
        return -code error -errorcode {M6 OUTPUT LONG} "output too long"
    }
    lappend output [dict create queue $queue target $target text $text]
}
proc ::m6host::output {} { variable output; return $output }

proc ::m6host::log {level module event} {
    variable logs
    if {$level ni {debug info warn error}} {
        return -code error -errorcode {M6 LOG LEVEL} "unknown log level"
    }
    lappend logs [dict create level $level module $module event $event]
}
proc ::m6host::logs {} { variable logs; return $logs }

proc ::m6host::bind_own {owner type mask callback} {
    variable ownedBinds
    set id [list $owner $type $mask $callback]
    if {$id ni $ownedBinds} { lappend ownedBinds $id }
    return $id
}
proc ::m6host::unbind_owner {owner} {
    variable ownedBinds
    set keep {}
    set removed 0
    foreach id $ownedBinds {
        if {[lindex $id 0] eq $owner} { incr removed } else { lappend keep $id }
    }
    set ownedBinds $keep
    return $removed
}
proc ::m6host::binds {} { variable ownedBinds; return $ownedBinds }

proc ::m6host::safe_child_path {root relative} {
    if {[file pathtype $relative] eq "absolute"} {
        return -code error -errorcode {M6 PATH ESCAPE} "absolute path rejected"
    }
    set base [file normalize $root]
    set candidate [file normalize [file join $base $relative]]
    if {$candidate ne $base && ![string match "$base/*" $candidate]} {
        return -code error -errorcode {M6 PATH ESCAPE} "path escapes module root"
    }
    return $candidate
}

proc ::m6host::provide {name} { variable capabilities; dict set capabilities $name 1 }
proc ::m6host::has_capability {name} { variable capabilities; dict exists $capabilities $name }

proc ::m6host::request_start {kind context} {
    variable requests; variable nextRequest; variable requestLimit
    if {[dict size $requests] >= $requestLimit} {
        return -code error -errorcode {M6 REQUEST FULL} "request limit reached"
    }
    incr nextRequest
    set id "r$nextRequest"
    dict set requests $id [dict create kind $kind context $context]
    return $id
}
proc ::m6host::request_cancel {id} {
    variable requests
    if {[dict exists $requests $id]} { dict unset requests $id; return 1 }
    return 0
}
proc ::m6host::request_complete {id result} {
    variable requests
    if {![dict exists $requests $id]} {
        return -code error -errorcode {M6 REQUEST STALE} "stale request"
    }
    set req [dict get $requests $id]
    dict unset requests $id
    return [dict create request $req result $result]
}
proc ::m6host::requests {} { variable requests; return $requests }

proc ::m6host::bot_message {version verb payload} {
    if {$version ne "1"} {
        return -code error -errorcode {M6 BOTNET VERSION} "unsupported botnet message version"
    }
    if {$verb ni {status reply event}} {
        return -code error -errorcode {M6 BOTNET VERB} "unsupported botnet verb"
    }
    if {[string length $payload] > 512} {
        return -code error -errorcode {M6 BOTNET LONG} "botnet payload too long"
    }
    return [dict create version $version verb $verb payload $payload]
}
