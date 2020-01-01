N, M = gets.chomp.split(" ").map(&:to_i)
A = []
B = []
M.times do |i|
  a, b = gets.chomp.split(" ").map(&:to_i)
  A << a-1
  B << b-1
end

class UnionFind
  def initialize(n)
    # 親の番号を格納．負の場合はrootで，グループのサイズ
    @parent = Array.new(n, -1)
  end

  def root(x)
    children = []
    r = x
    while @parent[r] >= 0
      children << r
      r = @parent[r]
    end
    children.each {|a| @parent[a] = r }
    r
  end

  def size(x)
    -@parent[root(x)]
  end

  def size_list
    @parent.select {|v| v < 0 }.map {|v| -v }
  end

  def same?(x, y)
    root(x) == root(y)
  end

  def unite(x, y)
    lhs = root(x)
    rhs = root(y)
    return if lhs == rhs
    ls = -@parent[lhs]
    rs = -@parent[rhs]
    if ls < rs
      @parent[rhs] -= ls
      @parent[lhs] = rhs
    else
      @parent[lhs] -= rs
      @parent[rhs] = lhs
    end
  end
end

# 逆順に橋がかかる想定で計算する
# 最初は橋がないので全組み合わせ(nC2)の不便さ
ans = Array.new(M)
ans[M-1] = N * (N-1) / 2

uf = UnionFind.new(N)
(M-1).downto(1) do |i|
  if uf.same?(A[i], B[i])
    ans[i-1] = ans[i]
  else
    # 新たにいけるようになった組み合わせ
    new_route = uf.size(A[i]) * uf.size(B[i])
    ans[i-1] = ans[i] - new_route
  end
  uf.unite(A[i], B[i])
end
ans.each do |a|
  puts a
end
