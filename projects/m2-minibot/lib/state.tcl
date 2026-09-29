package provide minibot::state 2.0
namespace eval ::minibot::state {
    variable data
}

proc ::minibot::state::reset {} {
    variable data
    set data [dict create count 0]
    return $data
}

proc ::minibot::state::snapshot {} {
    variable data
    if {![info exists data]} { reset }
    return $data
}

proc ::minibot::state::increment {} {
    variable data
    if {![info exists data]} { reset }
    dict incr data count
    return [dict get $data count]
}

proc ::minibot::state::save {path} {
    set f [open $path w]
    try {
        fconfigure $f -encoding utf-8 -translation lf
        puts $f [snapshot]
    } finally {
        close $f
    }
}

proc ::minibot::state::load {path} {
    variable data
    set f [open $path r]
    try {
        fconfigure $f -encoding utf-8 -translation auto
        set candidate [read $f]
    } finally {
        close $f
    }
    if {[catch {dict size $candidate}]} {
        return -code error -errorcode {MINIBOT STATE INVALID} "invalid MiniBot state"
    }
    if {![dict exists $candidate count] || ![string is integer -strict [dict get $candidate count]]} {
        return -code error -errorcode {MINIBOT STATE INVALID} "invalid MiniBot state"
    }
    set data $candidate
    return $data
}

reset
