X, Y, A, B, C = gets.chomp.split(" ").map(&:to_i)
pp = gets.chomp.split(" ").map(&:to_i).sort.reverse[0...X]
qq = gets.chomp.split(" ").map(&:to_i).sort.reverse[0...Y]
R = gets.chomp.split(" ").map(&:to_i).sort.reverse

mp = X-1
mq = Y-1

nr = 0
loop do
  m = [pp[-1], qq[-1]].compact.min
  break if nr >= C || m >= R[nr] || (pp.empty? && qq.empty?)
  nr += 1
  if qq.empty? || pp[-1] <= qq[-1]
    pp.pop
  elsif pp.empty? || pp[-1] > qq[-1]
    qq.pop
  end
end

puts (pp.inject(&:+) || 0) + (qq.inject(&:+) || 0) + (R[0...nr].inject(&:+) || 0)
