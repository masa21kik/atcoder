N = gets.chomp.to_i

if N % 2 == 0
  puts 0.5
else
  puts (N / 2 + 1) * 1.0 / N
end
