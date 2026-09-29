namespace eval ::irc {}
proc ::irc::decode_ctcp {text} {
    set delim [format %c 1]
    if {[string length $text] < 2 || [string index $text 0] ne $delim || [string index $text end] ne $delim} {
        return [dict create is_ctcp 0 text $text]
    }
    set body [string range $text 1 end-1]
    set space [string first " " $body]
    if {$space < 0} { set command $body; set argument "" } else {
        set command [string range $body 0 [expr {$space - 1}]]
        set argument [string range $body [expr {$space + 1}] end]
    }
    return [dict create is_ctcp 1 command [string toupper $command] argument $argument]
}
set d [format %c 1]
puts [::irc::decode_ctcp "${d}ACTION waves${d}"]
