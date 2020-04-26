N = gets.chomp.to_i
require "set"
S = Set.new
N.times do |i|
  S << gets.chomp
end
puts S.size
