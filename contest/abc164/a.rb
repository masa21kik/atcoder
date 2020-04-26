S, W = gets.chomp.split(" ").map(&:to_i)
if S > W
  puts "safe"
else
  puts "unsafe"
end
