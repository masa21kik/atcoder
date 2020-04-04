N, K = gets.chomp.split(" ").map(&:to_i)

s, m = N.divmod(K)
puts [N, m, (m-K).abs].min
