namespace eval ::irc {}
proc ::irc::casefold {value mapping} {
    set lower [string tolower $value]
    switch -exact -- [string tolower $mapping] {
        ascii { return $lower }
        strict-rfc1459 { return [string map [list {[} \{ {]} \} {\\} {|}] $lower] }
        rfc1459 { return [string map [list {[} \{ {]} \} {\\} {|} {^} {~}] $lower] }
        default { return -code error -errorcode [list IRC CASEMAPPING UNKNOWN $mapping] "unknown IRC casemapping: $mapping" }
    }
}
puts [::irc::casefold {Nick[One]} rfc1459]
