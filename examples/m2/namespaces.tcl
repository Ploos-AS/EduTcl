namespace eval ::greeter {
    variable greeting Hello

    proc setGreeting {value} {
        variable greeting
        set greeting $value
    }

    proc hello {nick} {
        variable greeting
        return "$greeting, $nick"
    }
}

puts [::greeter::hello Alice]
::greeter::setGreeting Hi
puts [::greeter::hello Bob]
