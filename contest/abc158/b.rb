N, A, B = gets.chomp.split(" ").map(&:to_i)

d, m = N.divmod(A+B)
puts d * A + [m, A].min
