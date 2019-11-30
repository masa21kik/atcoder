# require "prime"
# N = gets.chomp.to_i
# f = N.prime_division.map do |n, k|
#   [n] * k
# end.flatten.sort

# min_c = Float::INFINITY

# # 0.upto(f.size-2) do |i|
# #   c = (f[i...f.size-1].inject(&:*)-1) + (f[0...i] + [f[f.size-1]]).inject(&:*)-1
# #   min_c = c if c < min_c
# # end
# # puts min_c

# 1.upto(f.size) do |n|
#   f.combination(n).to_a.uniq.each do |vs|
#     v = vs.inject(&:*)
#     rest = N / v
#     c = v + rest - 2
#     min_c = c if c < min_c
#   end
# end
# puts min_c

N = gets.chomp.to_i
min_c = Float::INFINITY
1.upto(Math.sqrt(N)) do |n|
  a, b = N.divmod(n)
  next unless b.zero?
  c = n + a - 2
  min_c = c if c < min_c
end
puts min_c
