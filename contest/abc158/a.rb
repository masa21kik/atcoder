S = gets.chomp.split(//)
if S[0] != S[1] || S[1] != S[2]
  puts "Yes"
else
  puts "No"
end
