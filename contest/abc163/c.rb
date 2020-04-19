N = gets.chomp.to_i
A = gets.chomp.split(" ").map(&:to_i)

cnt = Hash.new(0)

A.each do |a|
  cnt[a] += 1
end

1.upto(N) do |i|
  puts cnt[i]
end
