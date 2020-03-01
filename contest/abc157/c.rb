N, M = gets.chomp.split(" ").map(&:to_i)
A = Array.new(N, nil)
e = false
M.times do |i|
  s, c = gets.chomp.split(" ").map(&:to_i)
  s -= 1
  if !A[s].nil? && A[s] != c
    e = true
  end
  A[s] = c
end
if e || (A[0] == 0 && N > 1)
  puts -1
  exit
elsif A[0].nil? && N == 1
  puts 0
  exit
end
A[0] = 1 if A[0].nil?
puts A.map{|v| v.nil? ? 0 : v }.join
