set nick Alice
set channel "#tcl"
set greeting "Hello $nick"

puts $greeting
puts {$greeting}
puts "Nick length: [string length $nick]"
puts "Channel: $channel"
