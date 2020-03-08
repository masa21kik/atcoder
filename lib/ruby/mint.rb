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

if __FILE__ == $PROGRAM_NAME
  n = Mint.new(10)
  m = Mint.new(5)
  require "pry"; binding.pry
  puts n
end
