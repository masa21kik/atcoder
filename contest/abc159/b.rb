S = gets.chomp
N = S.size

def kaibun?(s)
  0.upto(s.size / 2) do |i|
    return false if s[i] != s[s.size - 1 - i]
  end
  true
end

if kaibun?(S) && kaibun?(S[0...(N-1)/2]) && kaibun?(S[(N+3)/2-1...N])
  puts "Yes"
else
  puts "No"
end
