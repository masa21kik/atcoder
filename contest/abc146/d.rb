N = gets.chomp.to_i
AB = {}
link_cnt = Hash.new(0)
LINKS = {}
(N-1).times do |i|
  a, b = gets.chomp.split(" ").map(&:to_i)
  link_cnt[a] += 1
  link_cnt[b] += 1
  LINKS[a] ||= []
  LINKS[b] ||= []
  LINKS[a] << b
  LINKS[b] << a
  AB[[a, b]] = i
end

max_link = link_cnt.sort_by {|n,c| c }.reverse.first
K = max_link[1]
root = max_link[0]

require "set"
visited = Set.new
stack = [root]
colors = {}
parents = {}
while !stack.empty?
  n = stack.pop
  visited << n
  rest_colors = (1..K).to_a
  if parents[n]
    rest_colors.delete(colors[parents[n]])
  end
  links = []
  LINKS[n].each do |cn|
    if visited.include?(cn)
      next
    end
    idx = AB[[n, cn].sort]
    parents[cn] = idx
    colors[idx] = rest_colors.shift
    stack.push(cn)
  end
end

puts K
colors.sort_by{|k,_| k}.each do |k, v|
  puts v
end
