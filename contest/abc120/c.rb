S = gets.chomp

ans = 0
rest = []
0.upto(S.length - 1) do |i|
  if !rest.empty? && rest[-1] != S[i]
    rest.pop
    ans += 2
  else
    rest << S[i]
  end
end
puts ans
