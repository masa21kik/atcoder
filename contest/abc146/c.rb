A, B, X = gets.chomp.split(" ").map(&:to_i)

def keta(n)
  n.to_s.length
end

def price(n)
  A * n + B * keta(n)
end

if X >= price(10**9)
  puts 10**9
  exit
end
if price(1) < X
  puts 0
  exit
end

n1 = X / A
ps = {}
ps[n1] = price(n1)
prev_n = n1
loop do
  kk = keta(prev_n) - 1
  break if kk <= 0
  nn = (prev_n / 10**kk) * (10**kk)
  ps[nn] = price(nn)
  mid_n = nn + (prev_n - nn) / 2
  ps[mid_n] = price(mid_n)
  ps[nn-1] = price(nn-1)
  prev_n = nn - 1
  break if ps[nn-1] <= X
end
ts = ps.select {|n, v| v <= X }.sort_by {|_, v| v }.reverse.first
te = ps.select {|n, v| v > X }.sort_by {|_, v| v }.first
if ts.nil?
  puts 0
  exit
end
ans = 0
n = (ts[0]..te[0]).bsearch { |x| price(x) > X }
puts n - 1
