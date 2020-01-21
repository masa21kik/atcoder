N = gets.chomp.to_i
P = gets.chomp.split(" ").map(&:to_i)

ans = 0
min = Float::INFINITY
N.times do |i|
  if P[i] < min
    ans += 1
    min = P[i]
  end
end
puts ans
