N = gets.chomp.to_i
ans = 0
1.upto(N) do |i|
  ans += i if i % 3 != 0 && i % 5 != 0
end

puts ans
