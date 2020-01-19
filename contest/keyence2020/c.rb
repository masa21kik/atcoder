N, K, S = gets.chomp.split(" ").map(&:to_i)

first = true
K.times do
  if !first
    print " "
  end
  first = false
  print S
end
s = S + 1
s = 1 if S == 10**9
(N-K).times do
  print " #{s}"
end
puts ""
