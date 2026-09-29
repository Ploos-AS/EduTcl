namespace eval ::miniirc::serializer {}
proc ::miniirc::serializer::safe {v field} {
    if {[regexp {[\r\n]} $v]} { return -code error -errorcode [list MINIIRC SERIALIZE NEWLINE $field] "$field contains CR/LF" }
    return $v
}
proc ::miniirc::serializer::message {command {middle {}} {hasTrailing 0} {trailing ""}} {
    safe $command command
    if {$command eq "" || [regexp {[:[:space:]]} $command]} { return -code error -errorcode {MINIIRC SERIALIZE COMMAND} "invalid command" }
    set out [string toupper $command]
    foreach p $middle {
        safe $p parameter
        if {$p eq "" || [string index $p 0] eq ":" || [regexp {[[:space:]]} $p]} { return -code error -errorcode {MINIIRC SERIALIZE MIDDLE} "invalid middle parameter" }
        append out " " $p
    }
    if {$hasTrailing} { safe $trailing trailing; append out " :" $trailing }
    return $out
}
