N = gets.chomp.to_i
A = gets.chomp.split(" ").map(&:to_i)
MOD = 1000000007

ans = 1
cnt = [0, 0, 0]
A.each do |a|
  c = cnt.count { |v| v == a }
  i = cnt.index { |v| v == a }
  ans = ans * c % MOD
  if i.nil?
    puts 0
    exit
  end
  cnt[i] += 1
end
puts ans
