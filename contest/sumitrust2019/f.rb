T1, T2 = gets.chomp.split(" ").map(&:to_i)
A1, A2 = gets.chomp.split(" ").map(&:to_i)
B1, B2 = gets.chomp.split(" ").map(&:to_i)

R1 = A1 - B1
R2 = A2 - B2
DR1 = R1 * T1
DR2 = R2 * T2
DR = DR1 + DR2

if DR.zero?
  puts "infinity"
  exit
end
if DR1 * DR > 0
  puts 0
  exit
end

n, m = DR1.divmod(DR)
if m.zero?
  puts 1 + (n.abs - 1) * 2 + 1
else
  puts 1 + (n.abs - 1) * 2
end
