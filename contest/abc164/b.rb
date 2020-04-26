A, B, C, D = gets.chomp.split(" ").map(&:to_i)

t1, m1 = A.divmod(D)
t2, m2 = C.divmod(B)
t1 += 1 if m1 > 0
t2 += 1 if m2 > 0

if t1 < t2
  puts "No"
else
  puts "Yes"
end
