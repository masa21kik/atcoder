N = gets.chomp.to_i
S = Hash.new(0)
N.times do
  s = gets.chomp
  S[s] += 1
end

ans = nil
S.sort_by{|k,v| [-v, k]}.each do |k,v|
  ans = v if ans.nil?
  break if v < ans
  puts k
end
