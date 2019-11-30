N, M = gets.chomp.split(" ").map(&:to_i)
AB = []
N.times do |i|
  AB << gets.chomp.split(" ").map(&:to_i)
end

ans = 0
mm = 0
AB.sort_by {|v| v[0] }.each do |v|
  m = [v[1], M - mm].min
  ans += v[0] * m
  mm += m
  break if mm >= M
end
puts ans
