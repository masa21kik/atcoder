require "set"

N, U, V = gets.chomp.split(" ").map(&:to_i)
LINKS = {}
(N-1).times do |i|
  a, b = gets.chomp.split(" ").map(&:to_i)
  LINKS[a] ||= Set.new
  LINKS[b] ||= Set.new
  LINKS[a] << b
  LINKS[b] << a
end

def calc_depth(root_id)
  visited = Set.new([root_id])
  depth = {}
  depth[root_id] = 0
  stack = [root_id]
  while !stack.empty?
    n_id = stack.pop
    LINKS[n_id].each do |on_id|
      next if visited.include?(on_id)
      visited << on_id
      depth[on_id] = depth[n_id] + 1
      stack.push(on_id)
    end
  end
  depth
end

d1 = calc_depth(U)
d2 = calc_depth(V)

max_dist = d1[V]
1.upto(N) do |i|
  max_dist = d2[i] if d1[i] < d2[i] && max_dist < d2[i]
end
puts max_dist - 1
