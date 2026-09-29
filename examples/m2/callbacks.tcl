proc announce {prefix nick text} {
    return "$prefix $nick: $text"
}

set callback [list announce NOTICE]
set nick {$nick}
set text {[puts BAD]; still data}

puts [{*}$callback $nick $text]
