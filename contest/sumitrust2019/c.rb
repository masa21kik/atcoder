X = gets.chomp.to_i

n, m = X.divmod(100)

as = [5, 4, 3, 2, 1]
a = as.shift
cnt = 0
while cnt < n
  if m >= a
    m -= a
    cnt += 1
  elsif as.empty?
    break
  else
    a = as.shift
  end
  break if m.zero?
end
if m.zero?
  puts 1
else
  puts 0
end
