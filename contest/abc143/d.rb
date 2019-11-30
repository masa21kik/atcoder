N = gets.chomp.to_i
L = gets.chomp.split(" ").map(&:to_i).sort

ans = 0
(N-1).downto(2) do |i|
  (i-1).downto(1) do |j|
    l = [L[i] - L[j], L[j] - L[i]].max
    li = L[0..j-1].bsearch_index { |x| x > l }
    ans += j - li if li
  end
end

# 0.upto(N-3) do |i|
#   (i+1).upto(N-2) do |j|
#     l = [L[i] - L[j], L[j] - L[i]].max
#     u = L[i] + L[j]
#     li = L[j+1..-1].bsearch_index { |x| x > l }
#     next unless li
#     ui = L[j+1..-1].bsearch_index { |x| x >= u }
#     require "pry"; binding.pry
#     next if ui.nil? || ui.zero?
#     ans += ui - li
#   end
# end
puts ans
