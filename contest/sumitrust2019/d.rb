N = gets.chomp.to_i
S = gets.chomp.split(//).map(&:to_i)

require "set"
dp = {}
0.upto(N-1) do |i|
  dp.keys.each do |k1|
    dp[k1].keys.each do |k2|
      dp[k1][k2] << S[i]
    end
    dp[k1][S[i]] ||= Set.new
  end
  dp[S[i]] ||= {}
end
ans = 0
dp.each do |k1, v1|
  v1.each do |k2, v2|
    ans += v2.size
  end
end
puts ans
