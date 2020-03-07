S = gets.chomp
Q = gets.chomp.to_i

reverse = false
A = []
B = []
Q.times do |i|
  q = gets.chomp.split(" ")
  if q[0] == "1"
    reverse = !reverse
  else
    if q[1] == "1" && !reverse || q[1] == "2" && reverse
      A.unshift(q[2])
    else
      B.push(q[2])
    end
  end
end

if !reverse
  puts A.join + S + B.join
else
  puts B.reverse.join + S.reverse + A.reverse.join
end
