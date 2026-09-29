namespace eval ::miniirc::network { variable features {}; variable casemapping rfc1459 }
proc ::miniirc::network::reset {} { variable features; variable casemapping; set features {}; set casemapping rfc1459 }
proc ::miniirc::network::apply {token} {
    variable features; variable casemapping
    if {[string match "-*" $token]} { set k [string range $token 1 end]; if {$k ne ""} {dict unset features $k}; return }
    set p [string first "=" $token]
    if {$p < 0} { set k $token; set v "" } else { set k [string range $token 0 [expr {$p-1}]]; set v [string range $token [expr {$p+1}] end] }
    if {$k eq ""} { return -code error -errorcode {MINIIRC ISUPPORT KEY} "empty ISUPPORT key" }
    dict set features $k $v
    if {$k eq "CASEMAPPING"} { set casemapping [string tolower $v] }
}
proc ::miniirc::network::casefold {s} {
    variable casemapping; set x [string tolower $s]
    switch -exact -- $casemapping {
        ascii { return $x }
        strict-rfc1459 { return [string map [list {[} \{ {]} \} {\\} {|}] $x] }
        rfc1459 { return [string map [list {[} \{ {]} \} {\\} {|} {^} {~}] $x] }
        default { return -code error -errorcode [list MINIIRC CASEMAPPING UNKNOWN $casemapping] "unknown casemapping: $casemapping" }
    }
}
