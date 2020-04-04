K = gets.chomp.to_i

if K < 10
  puts K
  exit
end

def search(x, i, n, res = [])
  if x <= 1
    cs = [res[-1]-1, res[-1], res[-1]+1].select{|v| 0 <= v && v <= 9}
    res << cs[n-1]
    puts res.join
    exit
  end
  res << i
  nn = n
  cs = [i-1, i, i+1].select{|v| 0 <= v && v <= 9}
  cs.each do |j|
    if nn - PAT[x-1][j] <= 0
      return search(x-1, j, nn, res)
    end
    nn -= PAT[x-1][j]
  end
end

PAT = {}
PAT[1] = Hash.new(0)
0.upto(9) do |i|
  PAT[1][i] = [i-1, i, i+1].select{|v| 0 <= v && v <= 9}.size
end
k = 9


PAT[2] = Hash.new(0)
0.upto(9) do |i|
  PAT[2][i] = [i-1, i, i+1].select{|v| 0 <= v && v <= 9}.size
  if i > 0
    search(2, i, K-k) if k + PAT[2][i] >= K
    k += PAT[2][i]
  end
end

# x桁
3.upto(10) do |x|
  PAT[x] = Hash.new(0)
  0.upto(9) do |i|
    PAT[x][i] = PAT[x-1][i-1] + PAT[x-1][i] + PAT[x-1][i+1]
    if i > 0
      search(x, i, K-k) if k + PAT[x][i] >= K
      k += PAT[x][i]
    end
  end
end
