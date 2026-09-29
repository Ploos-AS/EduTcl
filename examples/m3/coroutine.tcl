proc ::countdown {from} {
    for {set n $from} {$n > 0} {incr n -1} {
        yield $n
    }
    return done
}

coroutine next ::countdown 3

while {[llength [info commands next]]} {
    set value [next]
    puts $value
}
