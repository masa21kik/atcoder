N = gets.chomp.to_i

ans = 0

pat = Hash.new(0)
1.upto(N) do |i|
  s = i.to_s
  key = [s[0].to_i, s[-1].to_i]
  pat[key] += 1
end

1.upto(9) do |i|
  1.upto(9) do |j|
    ans += pat[[i, j]] * pat[[j, i]]
  end
end
puts ans
