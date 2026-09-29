namespace eval ::irc {}
proc ::irc::parse_isupport_token {token} {
    if {$token eq ""} { return -code error -errorcode {IRC ISUPPORT EMPTY} "empty ISUPPORT token" }
    if {[string index $token 0] eq "-"} {
        set key [string range $token 1 end]
        if {$key eq ""} { return -code error -errorcode {IRC ISUPPORT KEY} "missing ISUPPORT key" }
        return [dict create key $key operation remove]
    }
    set eq [string first "=" $token]
    if {$eq < 0} { return [dict create key $token operation set value ""] }
    set key [string range $token 0 [expr {$eq - 1}]]
    if {$key eq ""} { return -code error -errorcode {IRC ISUPPORT KEY} "missing ISUPPORT key" }
    return [dict create key $key operation set value [string range $token [expr {$eq + 1}] end]]
}
foreach token {CHANTYPES=# PREFIX=(ov)@+ CASEMAPPING=rfc1459 -OLDTOKEN} { puts [::irc::parse_isupport_token $token] }
