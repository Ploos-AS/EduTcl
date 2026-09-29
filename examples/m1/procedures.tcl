proc normalize_command {name} {
    return [string tolower [string trim $name]]
}

proc greeting {nick {word Hello}} {
    return "$word, $nick"
}

set raw_command "  HELP "
puts [normalize_command $raw_command]
puts [greeting Alice]
puts [greeting Bob Hi]
