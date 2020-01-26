N, K = gets.chomp.split(" ").map(&:to_i)
H = gets.chomp.split(" ").map(&:to_i).sort.reverse

if K >= N
  puts 0
else
  puts H[K..-1].inject(&:+)
end
