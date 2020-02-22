N = gets.chomp.to_i
X = gets.chomp.split(" ").map(&:to_i)

def calc(p)
  X.map {|v| (v - p)**2 }.inject(&:+)
end

ans = Float::INFINITY
1.upto(100) do |p|
  c = calc(p)
  ans = c if c < ans
end
puts ans
