# Union-Find 素集合データ構造 (disjoint-set)
# グループ分けを管理
# はじめn個のものは別々のグループ
# 以下のクエリに対応
# 1. 2つのグループを1つにまとめる
# 2. 2つの要素が同一グループかどうか判定
#
# https://www.slideshare.net/chokudai/union-find-49066733
#
# UnionFind : 0 origin

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

if __FILE__ == $PROGRAM_NAME
  require "minitest"
  include Minitest::Assertions
  class << self; attr_accessor :assertions; end
  self.assertions = 0

  n = 3
  uf = UnionFind.new(n)
  assert_equal(uf.same?(0, 1), false)
  assert_equal(uf.same?(1, 2), false)
  assert_equal(uf.size(0), 1)
  uf.unite(0, 1)
  assert_equal(uf.same?(0, 1), true)
  assert_equal(uf.same?(1, 2), false)
  assert_equal(uf.size(0), 2)
  assert_equal(uf.size(1), 2)
  assert_equal(uf.size_list.sort, [1, 2])

  n = 10**5
  uf = UnionFind.new(n)
  0.upto(n/3-1) {|i| uf.unite(i, i+1) }
  (n/3+1).upto(2*n/3) {|i| uf.unite(i, i+1) }
  assert_equal(uf.same?(0, n/3), true)
  assert_equal(uf.same?(n/3+1, 2*n/3+1), true)
  assert_equal(uf.same?(n/3, n/3+1), false)
  assert_equal(uf.same?(0, n-1), false)
  assert_equal(uf.size(0), n/3+1)

  puts "All OK"
end
