M = gets.chomp.to_i
DC = []
M.times do |i|
  d, c = gets.chomp.split(" ").map(&:to_i)
  DC << { d: d, c: c }
end

sa = []
0.upto(M - 1) do |i|
  if DC[i][:c] > 1
    sa << { l: DC[i][:d], r: DC[i][:d], d: DC[i][:d] * 2, c: DC[i][:c] - 1}
  end
  if i < M - 1
    sa << { l: DC[i][:d], r: DC[i+1][:d], d: DC[i][:d] + DC[i+1][:d], c: 1 }
  end
end

rnd = 1
loop do
  mi = 0
  md = 0
  sa.each_with_index do |v, i|
    if v[:d] > md
      mi = i
      md = v[:d]
    end
  end

  # update sa
  deleted = false
  if sa[mi][:c] > 1
    sa[mi][:c] -= 1
  else
    sa.delete_at(mi)
    deleted = true
  end
  digits = md.to_s.split(//).map(&:to_i)
  if md >= 10
    sa.insert(mi, { l: digits[0], r: digits[1], d: digits[0] + digits[1], c: 1 })
  end
  if deleted
    sa.insert(mi, { l: sa[mi-1][:r], r: digits[0], d: sa[mi-1][:r] + digits[0], c: 1 })
  else
    sa.insert(mi+1, { l: sa[mi][:r], r: digits[0], d: sa[mi][:r] + digits[0], c: 1 })
  end
  if sa[mi-1][:c] > 1
    sa[mi-1][:c] -= 1
  else
    sa.delete_at(mi - 1)
  end
  rnd += 1
  break if sa.size == 1 && sa.first[:c] == 1
end
puts rnd
