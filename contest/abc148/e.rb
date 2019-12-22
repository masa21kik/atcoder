N = gets.chomp.to_i

if N % 2 == 1
  puts 0
  exit
end

d, _ = (N / 2).divmod(5)

ans = d

base = 5
while base <= d
  ans += (d / base)
  base *= 5
end

puts ans
