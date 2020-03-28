K, N = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i).sort

max_d = 0
0.upto(N-2).each do |i|
  d = A[i+1] - A[i]
  max_d = d if d > max_d
end

d = [A[0] + K - A[-1], A[-1] - A[0]].min
max_d = d if d > max_d

puts K - max_d
