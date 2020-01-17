N, K, M = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i)

target = N * M
cur = A.inject(&:+)
ans = target - cur
if ans <= 0
  puts 0
elsif ans <= K
  puts ans
else
  puts -1
end
