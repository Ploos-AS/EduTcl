set child [interp create -safe]

proc ::host_lookup {key} {
    set allowed [dict create language Tcl course EduTcl]
    if {![dict exists $allowed $key]} {
        return -code error "unknown key"
    }
    return [dict get $allowed $key]
}

interp alias $child lookup {} ::host_lookup

puts [interp eval $child {lookup language}]

set rc [catch {
    interp eval $child {open /etc/passwd r}
} message]

puts "raw file access available: [expr {!$rc}]"

interp delete $child
