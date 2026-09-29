package provide minibot::config 2.0
namespace eval ::minibot::config {}

proc ::minibot::config::defaults {} {
    return [dict create prefix ! channels [list "#tcl" "#eggdrop"]]
}

proc ::minibot::config::validate {cfg} {
    foreach key {prefix channels} {
        if {![dict exists $cfg $key]} {
            return -code error -errorcode [list MINIBOT CONFIG MISSING $key] "missing configuration key: $key"
        }
    }
    if {[dict get $cfg prefix] eq ""} {
        return -code error -errorcode {MINIBOT CONFIG INVALID prefix} "prefix must not be empty"
    }
    if {[catch {llength [dict get $cfg channels]}]} {
        return -code error -errorcode {MINIBOT CONFIG INVALID channels} "channels must be a list"
    }
    return $cfg
}

proc ::minibot::config::make {args} {
    set cfg [defaults]
    if {[llength $args] % 2} {
        return -code error -errorcode {MINIBOT CONFIG ARGUMENTS} "configuration overrides must be key/value pairs"
    }
    foreach {key value} $args {
        dict set cfg $key $value
    }
    return [validate $cfg]
}
