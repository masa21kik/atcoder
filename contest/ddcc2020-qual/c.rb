H, W, K = gets.chomp.split(" ").map(&:to_i)
M = []
M << Array.new(W+2, nil)
H.times do |i|
  mm = gets.chomp.split(//)
  M << [nil, mm, nil].flatten
end
M << Array.new(W+2, nil)

ANS = Array.new(H+2)
(H+2).times do |i|
  ANS[i] = Array.new(W+2, nil)
end

def fill_arround(h, w, k)
  ANS[h][w] = k
  step = { up: 0, down: 0, left: 0, right: 0 }
  while M[h - step[:up] - 1][w] == "." && ANS[h - step[:up] - 1][w].nil?
    step[:up] += 1
  end
  while M[h + step[:down] + 1][w] == "." && ANS[h + step[:down] + 1][w].nil?
    step[:down] += 1
  end
  while M[h][w - step[:left] - 1] == "." && ANS[h][w - step[:left] - 1].nil?
    step[:left] += 1
  end
  while M[h][w + step[:right] + 1] == "." && ANS[h][w + step[:right] + 1].nil?
    step[:right] += 1
  end

  # up-left
  up = step[:up]
  1.upto(up) { |u| ANS[h - u][w] = k }
  left = 0
  1.upto(step[:left]) do |l|
    ok = true
    0.upto(up) do |u|
      if M[h - u][w - l] != "." || !ANS[h - u][w - l].nil?
        ok = false
        break
      end
    end
    break unless ok

    left = l
    0.upto(up) do |u|
      ANS[h - u][w - l] = k
    end
  end

  # up-right
  right = 0
  1.upto(step[:right]) do |r|
    ok = true
    0.upto(up) do |u|
      if M[h - u][w + r] != "." || !ANS[h - u][w + r].nil?
        ok = false
        break
      end
    end
    break unless ok

    right = r
    0.upto(up) do |u|
      ANS[h - u][w + r] = k
    end
  end

  # down
  down = 0
  1.upto(step[:down]) do |d|
    ok = true
    (-left).upto(right) do |i|
      if M[h + d][w + i] != "." || !ANS[h + d][w + i].nil?
        ok = false
        break
      end
    end
    break unless ok

    down = d
    (-left).upto(right) { |i| ANS[h + d][w + i] = k }
  end
end

k = 0
1.upto(H) do |h|
  1.upto(W) do |w|
    if M[h][w] == "#"
      k += 1
      fill_arround(h, w, k)
    end
  end
end

1.upto(H) do |h|
  puts ANS[h][1..-2].join(" ")
end
