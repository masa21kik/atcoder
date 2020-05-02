A, B, N = gets.chomp.split(" ").map(&:to_i)

x = [B-1, N].min
puts (1.0*A*x/B).to_i - (A*(1.0*x/B).to_i)
