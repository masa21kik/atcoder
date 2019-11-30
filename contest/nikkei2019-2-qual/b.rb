N = gets.chomp.to_i
D = gets.chomp.split(" ").map(&:to_i)
MOD = 998244353

ans = 1
cnt = Hash.new(0)
0.upto(N-1) do |i|
  cnt[D[i]] += 1
end
puts cnt.inspect
1.upto(N-1) do |i|
  ans *= cnt[i-1] ** cnt[i]
end
puts ans % MOD
