N, R = gets.chomp.split(" ").map(&:to_i)

if N >= 10
  puts R
else
  puts R + 100 * (10 - N)
end
