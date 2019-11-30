A, B = gets.chomp.split(" ").map(&:to_i)

require "prime"

gcd = A.gcd(B)
puts gcd.prime_division.size + 1
