N = gets.chomp.to_i
S = gets.chomp.split(//)

dp = Array.new(N + 1).map { Array.new(N + 1, 0) }

max_score = 0
(N - 1).downto(0) do |j|
  (j - 1).downto(0) do |i|
    if S[i] == S[j]
      dp[i][j] = 1 + dp[i + 1][j + 1]
      if i + dp[i][j] <= j
        score = dp[i][j]
        max_score = score if max_score < score
      end
    end
  end
end

puts max_score
