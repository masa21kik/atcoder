N = gets.chomp.to_i
S = gets.chomp

alpha = ("A".."Z").to_a
S.split(//).each do |c|
  idx = (c.ord - "A".ord + N) % 26
  print alpha[idx]
end
print "\n"
