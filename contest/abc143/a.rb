A, B = gets.chomp.split(" ").map(&:to_i)
puts [A - 2 * B, 0].max
