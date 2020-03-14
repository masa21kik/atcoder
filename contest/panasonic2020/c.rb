A, B, C = gets.chomp.split(" ").map(&:to_i)

if A * B * 4 < (C - A - B)**2 && C - A - B > 0
  puts "Yes"
else
  puts "No"
end
