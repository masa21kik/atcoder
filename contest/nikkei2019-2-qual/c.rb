N = gets.chomp.to_i
A = gets.chomp.split(" ").map(&:to_i)
B = gets.chomp.split(" ").map(&:to_i)

a = A.sort
b = B.sort
if a.zip(b).any? {|v| v[0] > v[1] }
  puts "No"
  exit
end

AB = A.zip(B)
puts AN.sort_by{|v| [v[1], v[0]]}.inspect
