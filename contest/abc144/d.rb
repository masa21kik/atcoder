A, B, X = gets.chomp.split(" ").map(&:to_i)
H = X.to_f / A**2

if A * B / 2.0 > A * H
  theta = Math.atan(B**2 / (2*H*A))
else
  theta = Math.atan((2 * B - 2 * H) / A)
end
puts theta * 180 / Math::PI
