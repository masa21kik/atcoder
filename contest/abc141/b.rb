S = gets.chomp

s = S.split(//)
K = %w(R U D).freeze
G = %w(L U D).freeze
0.upto(S.length - 1) do |i|
  n = i + 1
  if (n % 2 == 0 && !G.include?(s[i])) ||
     (n % 2 == 1 && !K.include?(s[i]))
    puts "No"
    exit
  end
end

puts "Yes"
