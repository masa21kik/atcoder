K, X = gets.chomp.split(" ").map(&:to_i)

if 500 * K >= X
  puts "Yes"
else
  puts "No"
end
