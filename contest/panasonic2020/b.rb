H, W = gets.chomp.split(" ").map(&:to_i)
if H == 1 || W == 1
  puts 1
elsif H % 2 == 0 || W % 2 == 0
  puts H * W / 2
else
  puts H * W / 2 + 1
end
