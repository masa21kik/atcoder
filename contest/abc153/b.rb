H, N = gets.chomp.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i)

d = A.inject(&:+)
if H <= d
  puts 'Yes'
else
  puts 'No'
end
