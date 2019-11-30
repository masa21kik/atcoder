N, K = gets.chomp.split(" ").map(&:to_i)
H = gets.chomp.split(" ").map(&:to_i)

cnt = 0
H.each do |h|
  cnt += 1 if h >= K
end
puts cnt
