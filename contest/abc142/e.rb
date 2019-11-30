N, M = gets.chomp.split(" ").map(&:to_i)

A = {}
B = {}
CB = {}

M.times do |i|
  A[i], B[i] = gets.chomp.split(" ").map(&:to_i)
  CB[i] = gets.chomp.split(" ").map(&:to_i).map{|v| (1 << v-1)}.inject(0){|a,e| a |= e}
end

dp = {}
(M + 1).times {|i| dp[i] = Hash.new(0) }
M.times do |i|
  dp[i].keys.each do |pat|
    npat = pat | CB[i]
    if dp[i].key?(npat)
      dp[i + 1][npat] = [dp[i][npat], dp[i][pat] + A[i]].min
    else
      dp[i + 1][npat] = dp[i][pat] + A[i]
    end
    # 選ばなかったとき
    dp[i + 1][pat] = dp[i][pat]
  end
  npat = CB[i]
  if dp[i].key?(npat)
    dp[i + 1][npat] = [dp[i][npat], A[i]].min
  else
    dp[i + 1][npat] = A[i]
  end
end

min_a = dp[M].select {|k,v| k == (1 << N) - 1}.map {|k,v| v}.min
if min_a.nil?
  puts -1
else
  puts min_a
end
