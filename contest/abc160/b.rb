X = gets.chomp.to_i

ans = 0
s, m = X.divmod(500)
ans += 1000 * s
s5, m5 = m.divmod(5)
ans += 5 * s5
puts ans
