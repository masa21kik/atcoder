H, N = gets.chomp.split(" ").map(&:to_i)

dp = Array.new(20001, 0xffffffff)
dp[0] = 0
N.times do |i|
  a, b = gets.chomp.split(" ").map(&:to_i)
  (0...H).each do |j|
    hp, mp = j + a, dp[j] + b
    dp[hp] = mp if mp < dp[hp]
  end
end
puts dp.drop(H).min
