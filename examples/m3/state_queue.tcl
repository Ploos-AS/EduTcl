namespace eval ::demo {
    variable state idle
    variable queue {}
    variable maxQueue 3
}

proc ::demo::transition {to} {
    variable state
    set allowed [dict create         idle {running closed}         running {stopping closed}         stopping {closed}         closed {}]
    if {$to ni [dict get $allowed $state]} {
        return -code error -errorcode [list DEMO STATE $state $to]             "invalid transition: $state -> $to"
    }
    set state $to
    return $state
}

proc ::demo::enqueue {item} {
    variable queue
    variable maxQueue
    if {[llength $queue] >= $maxQueue} {
        return -code error -errorcode {DEMO QUEUE FULL} "queue is full"
    }
    lappend queue $item
    return [llength $queue]
}

proc ::demo::dequeue {} {
    variable queue
    if {[llength $queue] == 0} {
        return -code error -errorcode {DEMO QUEUE EMPTY} "queue is empty"
    }
    set item [lindex $queue 0]
    set queue [lrange $queue 1 end]
    return $item
}

::demo::transition running
foreach item {one two three} {
    ::demo::enqueue $item
}
while {[llength $::demo::queue]} {
    puts [::demo::dequeue]
}
::demo::transition stopping
::demo::transition closed
