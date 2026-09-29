set commands [list help hello health about]

puts "exact:  [lsearch -all -inline -exact $commands help]"
puts "glob:   [lsearch -all -inline -glob $commands "he*"]"
puts "regexp: [lsearch -all -inline -regexp $commands {^he(l|a)}]"

set input "ticket-1234"
if {[regexp {^ticket-([0-9]+)$} $input -> id]} {
    puts "id=$id"
}
