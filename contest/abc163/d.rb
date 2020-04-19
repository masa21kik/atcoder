class Mint
  MOD = 1_000_000_007

  attr_reader :x

  def initialize(x)
    @x = ((x % MOD) + MOD) % MOD
  end

  def to_s
    @x.to_s
  end

  def -@
    Mint.new(-@x)
  end

  def +(a)
    Mint.new(@x).add(a)
  end

  def -(a)
    Mint.new(@x).sub(a)
  end

  def *(a)
    Mint.new(@x).mul(a)
  end

  def /(a)
    Mint.new(@x).div(a)
  end

  def add(a)
    @x += a.x
    @x -= MOD if @x >= MOD
    self
  end

  def sub(a)
    @x += MOD - a.x
    @x -= MOD if @x >= MOD
    self
  end

  def mul(a)
    @x = (@x * a.x) % MOD
    self
  end

  def pow(t)
    return Mint.new(1) if t.zero?
    a = pow(t >> 1)
    a = a.mul(a)
    a = a.mul(self) if (t % 2) == 1
    a
  end

  def inv
    pow(MOD - 2)
  end

  def div(a)
    self.mul(a.inv)
  end

  def factorial
    return Mint.new(1) if @x.zero?
    (1..@x).map{|v| Mint.new(v)}.inject(:mul)
  end

  def permutation(k)
    return Mint.new(1) if k.zero?
    (@x - k + 1..@x).map{|v| Mint.new(v)}.inject(:mul)
  end

  def combination(k)
    permutation(k).div(Mint.new(k).factorial)
  end
end

N, K = gets.chomp.split(" ").map(&:to_i)

ans = Mint.new(0)
min_x = (0..K-1).inject(&:+)
max_x = (N-K+1..N).inject(&:+)
ans += Mint.new(max_x - min_x + 1)

(K+1).upto(N+1) do |k|
  min_x += k-1
  max_x += N-k+1
  ans += Mint.new(max_x - min_x + 1)
end
puts ans
