N, M = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i)

s = A.inject(&:+)
if N >= s
  puts N - s
else
  puts "-1"
end
