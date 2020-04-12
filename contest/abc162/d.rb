N = gets.chomp.to_i
S = gets.chomp

IDX = {"R"=>[], "G"=>[], "B"=>[]}

0.upto(N-1) do |i|
  IDX[S[i]] << i
end

ng = Hash.new(0)
IDX["R"].each do |i|
  IDX["G"].each do |j|
    a, b = [i, j].sort
    gap = b - a
    ng[(a+b)/2] += 1 if gap.even?
    ng[a-gap] += 1
    ng[b+gap] += 1
  end
end

ans = IDX["R"].size * IDX["G"].size * IDX["B"].size
IDX["B"].each do |k|
  ans -= ng[k]
end
puts ans
