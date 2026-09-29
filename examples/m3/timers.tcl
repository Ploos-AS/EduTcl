namespace eval ::demo {
    variable events {}
    variable done 0
    variable timer ""
}

proc ::demo::record {value} {
    variable events
    lappend events $value
}

proc ::demo::finish {} {
    variable done
    record finished
    set done 1
}

::demo::record start
set ::demo::timer [after 10 [list ::demo::record timer]]
after 20 [list ::demo::finish]

vwait ::demo::done

puts [join $::demo::events " -> "]
