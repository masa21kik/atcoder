M1, D1 = gets.chomp.split(" ").map(&:to_i)
M2, D2 = gets.chomp.split(" ").map(&:to_i)

if M1 != M2
  puts "1"
else
  puts "0"
end
