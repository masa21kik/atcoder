N, M = gets.chomp.split(" ").map(&:to_i)
AB = []
LINK = {}
M.times do |i|
  a, b = gets.chomp.split(" ").map(&:to_i)
  AB << [a, b]
  LINK[a] ||= []
  LINK[b] ||= []
  LINK[a] << b
  LINK[b] << a
end

require "set"

def connected(root_id)
  route = {}
  visited = Set.new([root_id])
  stack = [root_id]
  while !stack.empty?
    nid = stack.pop
    LINK[nid].each do |oid|
      next if visited.include?(oid)
      visited << oid
      stack << oid
    end
  end
  visited
end

def fuben
  con = {}
  con[1] = connected(1)
  rest = ((2..N).to_set - con[1]).to_a
  while !rest.empty?
    id = rest.pop
    con[id] = connected(id)
    rest = rest - con[id].to_a
  end
  a = con.map {|_, v| v.size }
  f = 0
  0.upto(a.size - 2) do |i|
    (i+1).upto(a.size - 1) do |j|
      f += a[i] * a[j]
    end
  end
  f
end

M.times do |i|
  a, b = AB[i]
  LINK[a].delete(b)
  LINK[b].delete(a)
  puts fuben
end
