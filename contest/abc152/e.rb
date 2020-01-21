N = gets.chomp.to_i
A = gets.chomp.split(" ").map(&:to_i)
MOD = 10**9 + 7

lcm = A.inject(1){|a, e| a = a.lcm(e)}
puts A.inject(0){|a, e| a = (a + lcm / e) } % MOD
