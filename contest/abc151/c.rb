N, M = gets.chomp.split(" ").map(&:to_i)
cnt = {}
M.times do |i|
  p, s = gets.chomp.split(" ")
  cnt[p] ||= { ac: 0, wa: 0 }
  if s == "AC"
    cnt[p][:ac] = 1
  elsif s == "WA" && cnt[p][:ac].zero?
    cnt[p][:wa] += 1
  end
end

ac_cnt = cnt.select{|_, v| v[:ac] > 0}
ac = ac_cnt.count
wa = 0
ac_cnt.each {|_, v| wa += v[:wa] }
puts "#{ac} #{wa}"
