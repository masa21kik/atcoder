N = gets.chomp.to_i

x = N / 1.08
if (x.floor * 1.08).floor == N
  puts x.floor
elsif (x.ceil * 1.08).floor == N
  puts x.ceil
else
  puts ":("
end
