A, B, K = gets.chomp.split(" ").map(&:to_i)

k = 0
100.downto(1) do |i|
  if A % i == 0 && B % i == 0
    k += 1
    if k == K
      puts i
      exit
    end
  end
end
