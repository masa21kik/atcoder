N = gets.chomp.to_i
S = gets.chomp

ans = 0
prev_s = nil
0.upto(N-1) do |i|
  ans += 1 if prev_s != S[i]
  prev_s = S[i]
end
puts ans
