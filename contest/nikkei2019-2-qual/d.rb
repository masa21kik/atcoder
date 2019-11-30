N, M = gets.chomp.split(" ").map(&:to_i)
lrc = []
M.times do |i|
  lrc << gets.chomp.split(" ").map(&:to_i)
end
LRC = lrc.sort_by {|l,r,c| [l, r, c]}

def select_lrc(x)
  l = LRC.bsearch_index {|v| v[0] > x }
  return [] if l.nil?
  LRC[0...l].select {|v| v[1] > x }
end

dp = Hash.new(Float::INFINITY)
dp[1] = 0
1.upto(N-1) do |n|
  select_lrc(n).each do |lrc|
    n.upto(lrc[1]) do |r|
      dp[r] = dp[n] + lrc[2] if dp[r] > dp[n] + lrc[2]
    end
  end
end
if dp[N] == Float::INFINITY
  puts "-1"
else
  puts dp[N]
end
