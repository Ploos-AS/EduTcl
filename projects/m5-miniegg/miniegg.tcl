namespace eval ::miniegg {
    variable binds {}
    variable output {}
    variable handFlags {}
}

proc ::miniegg::reset {} {
    variable binds; variable output; variable handFlags
    set binds {}; set output {}; set handFlags {}
}

proc ::bind {type flags mask callback} {
    variable ::miniegg::binds
    lappend ::miniegg::binds [dict create type $type flags $flags mask $mask callback $callback]
    return $callback
}

proc ::miniegg::set_flags {hand flags} {
    variable handFlags
    dict set handFlags $hand $flags
}

proc ::miniegg::allowed {required hand} {
    variable handFlags
    if {$required eq "-" || $required eq ""} { return 1 }
    if {![dict exists $handFlags $hand]} { return 0 }
    set have [dict get $handFlags $hand]
    foreach ch [split $required ""] {
        if {$ch eq "" || $ch eq "-" || $ch eq "|"} continue
        if {[string first $ch $have] < 0} { return 0 }
    }
    return 1
}

proc ::miniegg::matching {type mask hand} {
    variable binds
    set out {}
    foreach b $binds {
        if {[dict get $b type] ne $type} continue
        set bm [dict get $b mask]
        if {$bm ne "*" && $bm ne $mask} continue
        if {![allowed [dict get $b flags] $hand]} continue
        lappend out $b
    }
    return $out
}

proc ::miniegg::emit_pub {nick uhost hand chan text} {
    set words [split $text]; if {![llength $words]} { return 0 }
    set command [lindex $words 0]; set rest [join [lrange $words 1 end] " "]; set count 0
    foreach b [matching pub $command $hand] {
        uplevel #0 [list [dict get $b callback] $nick $uhost $hand $chan $rest]; incr count
    }
    return $count
}

proc ::miniegg::emit_msg {nick uhost hand text} {
    set words [split $text]; if {![llength $words]} { return 0 }
    set command [lindex $words 0]; set rest [join [lrange $words 1 end] " "]; set count 0
    foreach b [matching msg $command $hand] {
        uplevel #0 [list [dict get $b callback] $nick $uhost $hand $rest]; incr count
    }
    return $count
}

proc ::miniegg::emit_join {nick uhost hand chan} {
    set count 0
    foreach b [matching join $chan $hand] {
        uplevel #0 [list [dict get $b callback] $nick $uhost $hand $chan]; incr count
    }
    return $count
}

proc ::miniegg::emit_part {nick uhost hand chan reason} {
    set count 0
    foreach b [matching part $chan $hand] {
        uplevel #0 [list [dict get $b callback] $nick $uhost $hand $chan $reason]; incr count
    }
    return $count
}

proc ::miniegg::emit_sign {nick uhost hand chan reason} {
    set count 0
    foreach b [matching sign $chan $hand] {
        uplevel #0 [list [dict get $b callback] $nick $uhost $hand $chan $reason]; incr count
    }
    return $count
}

proc ::miniegg::emit_nick {nick uhost hand chan newnick} {
    set count 0
    foreach b [matching nick $chan $hand] {
        uplevel #0 [list [dict get $b callback] $nick $uhost $hand $chan $newnick]; incr count
    }
    return $count
}

proc ::miniegg::emit_raw {from keyword text} {
    set count 0
    foreach b [matching raw $keyword *] {
        uplevel #0 [list [dict get $b callback] $from $keyword $text]; incr count
    }
    return $count
}

proc ::miniegg::record {kind line} {
    variable output
    if {[regexp {[\r\n]} $line]} { return -code error -errorcode {MINIEGG OUTPUT NEWLINE} "output contains CR/LF" }
    lappend output [dict create kind $kind line $line]
}
proc ::putserv {line} { ::miniegg::record putserv $line }
proc ::puthelp {line} { ::miniegg::record puthelp $line }
proc ::putquick {line} { ::miniegg::record putquick $line }
proc ::miniegg::output {} { variable output; return $output }

::miniegg::reset
