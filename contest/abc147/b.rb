S = gets.chomp
L = S.length

ans = 0
((L+1)/2).times do |i|
  ans += 1 if S[i] != S[L-1-i]
end
puts ans
