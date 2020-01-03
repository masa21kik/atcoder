A, B, Q = gets.chomp.split(" ").map(&:to_i)
S = []
T = []
X = []
A.times do
  S << gets.chomp.to_i
end
B.times do
  T << gets.chomp.to_i
end
Q.times do
  X << gets.chomp.to_i
end

X.each do |x|
  si = S.bsearch_index{|v| v >= x}
  sc = []
  if si.nil?
    sc = [S[-1]]
  elsif si.zero?
    sc = [S[0]]
  else
    sc = [S[si-1], S[si]]
  end
  ti = T.bsearch_index{|v| v >= x}
  tc = []
  if ti.nil?
    tc = [T[-1]]
  elsif ti.zero?
    tc = [T[0]]
  else
    tc = [T[ti-1], T[ti]]
  end
  min_cost = Float::INFINITY
  sc.each do |ss|
    tc.each do |tt|
      if (ss <= x && tt <= x) || (ss >= x && tt >= x)
        # 同じ方向
        cost = [(ss-x).abs, (tt-x).abs].max
      else
        # 逆方向
        cost = [(ss - x).abs + (tt - ss).abs, (tt - x).abs + (ss - tt).abs].min
      end
      min_cost = cost if cost < min_cost
    end
  end
  puts min_cost
end
