N = gets.chomp.to_i
xy = []
N.times do |i|
  xy << gets.chomp.split(" ").map(&:to_i)
end


def dist(xy1, xy2)
  @dist ||= {}
  k = [xy1, xy2].sort
  @dist[k] ||= Math.sqrt((xy1[0] - xy2[0])**2 + (xy1[1] - xy2[1])**2)
end

sum_d = 0
n_pat = 0
(1..N).to_a.permutation(N).each do |pat|
  d = 0
  0.upto(pat.size - 2) do |x|
    i = pat[x]-1
    j = pat[x+1]-1
    d += dist(xy[i], xy[j])
  end
  sum_d += d
  n_pat += 1
end

puts sum_d / n_pat
