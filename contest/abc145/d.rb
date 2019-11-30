X, Y = gets.chomp.split(" ").map(&:to_i)
MOD = 10**9 + 7

if (Y + X) % 3 != 0 || Y > 2 * X || Y < X * 0.5
  puts 0
  exit
end

K = (Y + X) / 3
B = (2 * Y - X) / 3
C = -(Y - 2 * X) / 3
L, M = [B, C].sort

puts [K, L, M].inspect
# K回の移動のうち，L回を横移動
puts ((K-L+1..K).inject(&:*) / (1..L).inject(&:*)) % MOD


# if L.zero?
#   puts 1
#   exit
# end

# dp = [1,1]
# 2.upto(K) do |k|
#   new_dp = Array.new(k+1, 1)
#   1.upto(k-1) do |i|
#     new_dp[i] = (dp[i] + dp[i-1]) % MOD
#   end
#   dp = new_dp
# end
# puts dp[L] % MOD


# dp = Array.new(L+1)
# 0.upto(L+1) do |l|
#   dp[l] = Array.new(M+1, 1)
# end

# 1.upto(L) do |l|
#   1.upto(M) do |m|
#     dp[l][m] = (dp[l-1][m] + dp[l][m-1]) % MOD
#   end
# end
# puts dp[L][M] % MOD
