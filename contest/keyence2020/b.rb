N = gets.chomp.to_i
XL = []
N.times do |i|
  x, l = gets.chomp.split(" ").map(&:to_i)
  XL << {left: x - l, right: x + l}
end
XL.sort_by! {|v| v[:right]}

ans = 0
cur = -Float::INFINITY
XL.each do |v|
  if cur <= v[:left]
    ans += 1
    cur = v[:right]
  end
end
puts ans
