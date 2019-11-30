A, B, X = gets.chomp.split(" ").map(&:to_i)
 
def keta(n)
  n.to_s.length
end
 
def price(n)
  A * n + B * keta(n)
end
 
# N = X / Aを試す
n1 = X / A
p1 = price(n1)
 
# X/Aの最上位桁以外の切り下げを試す
k = keta(n1)
n2 = (n1 / 10**k) * (10**k)
p2 = price(n2)
 
# n2から桁を1つ下げる
n3 = n2 - 1
p3 = price(n3)
 
st = n1
if p3 > X
  st = n3
elsif p2 > X
  st = n2
end

if price(1) > X
  puts 0
  exit
end
if price(10**9) <= X
  puts 10**9
  exit
end
st = [10**9, st].min
n = (1..st).bsearch { |x| price(x) > X }
if n.nil?
  puts st
else
  puts n - 1
end
