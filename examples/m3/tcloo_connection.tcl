oo::class create ::DemoConnection {
    variable state timer

    constructor {} {
        set state idle
        set timer ""
    }

    method state {} {
        return $state
    }

    method start {} {
        if {$state ne "idle"} {
            error "cannot start from $state"
        }
        set state connecting
        set timer [after 20 [list [self] connected]]
    }

    method connected {} {
        set timer ""
        if {$state ne "connecting"} {
            return
        }
        set state connected
    }

    method cancel {} {
        if {$timer ne ""} {
            after cancel $timer
            set timer ""
        }
        set state closed
    }

    destructor {
        if {$timer ne ""} {
            after cancel $timer
        }
    }
}

set c [::DemoConnection new]
$c start
set done 0
after 30 [list set done 1]
vwait done
puts [$c state]
$c destroy
