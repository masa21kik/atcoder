H = gets.chomp.to_i
W = gets.chomp.to_i
N = gets.chomp.to_i

l = [H, W].max
s = [H, W].min

puts (N * 1.0/ l).ceil
