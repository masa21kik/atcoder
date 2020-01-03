N = gets.chomp.to_i
ans = 0
N.times do |i|
  x, u = gets.chomp.split(" ")
  if u == "JPY"
    ans += x.to_f
  else
    ans += (x.to_f * 380000.0)
  end
end
puts ans
