namespace eval ::edutcl::toolkit {
    variable notes {}
    variable maxChannels 16
    variable maxNoteLength 120
}

proc ::edutcl::toolkit::reset {} { variable notes; set notes {} }

proc ::edutcl::toolkit::set_note {chan text} {
    variable notes; variable maxChannels; variable maxNoteLength
    set text [string trim $text]
    if {$text eq ""} { return -code error -errorcode {TOOLKIT NOTE EMPTY} "empty note" }
    if {[string length $text] > $maxNoteLength} { return -code error -errorcode {TOOLKIT NOTE LONG} "note too long" }
    if {![dict exists $notes $chan] && [dict size $notes] >= $maxChannels} {
        return -code error -errorcode {TOOLKIT NOTE FULL} "channel note limit reached"
    }
    dict set notes $chan $text
    return $text
}

proc ::edutcl::toolkit::get_note {chan} {
    variable notes
    if {![dict exists $notes $chan]} { return "" }
    return [dict get $notes $chan]
}

proc ::edutcl::toolkit::clear_note {chan} {
    variable notes
    if {[dict exists $notes $chan]} { dict unset notes $chan; return 1 }
    return 0
}

proc ::edutcl::toolkit::dispatch {host hand chan text} {
    set words [split [string trim $text]]
    set sub [string tolower [lindex $words 0]]
    switch -exact -- $sub {
        members {
            return "members: [llength [{*}$host members $chan]]"
        }
        note {
            set note [get_note $chan]
            if {$note eq ""} { return "note: none" }
            return "note: $note"
        }
        setnote {
            if {![{*}$host has_flag $hand m]} {
                return -code error -errorcode {TOOLKIT AUTH DENIED} "permission denied"
            }
            set_note $chan [join [lrange $words 1 end] " "]
            return "note updated"
        }
        clearnote {
            if {![{*}$host has_flag $hand m]} {
                return -code error -errorcode {TOOLKIT AUTH DENIED} "permission denied"
            }
            clear_note $chan
            return "note cleared"
        }
        capabilities {
            set names {}
            foreach name {dns botnet dcc} {
                if {[{*}$host has_capability $name]} { lappend names $name }
            }
            if {![llength $names]} { return "capabilities: none" }
            return "capabilities: [join $names ,]"
        }
        default {
            return "commands: members note setnote clearnote capabilities"
        }
    }
}
