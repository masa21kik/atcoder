N, X, Y = gets.chomp.split(" ").map(&:to_i)

A = Array.new(N*N)

1.upto(N-1) do |k|
  ans = 0
  1.upto(N-1) do |i|
    c0 = i + k
    if c0 <= N
      if A[i * N + c0].nil?
        A[i * N + c0] = k
        ans += 1
      end
      if (i <= X && i + k > X) || (i > X && i - X < k)
        s = k - ((X - i).abs + 1)
        cs = [Y+s, Y-s]
        cs = [Y] if s.zero?
        cs.select{|v| v <= N && v != i && (v - i).abs > k }.each do |c|
          a, b = [i, c]
          a, b = [b, a] if a > b
          if A[a * N + b].nil?
            A[a * N + b] = k
            ans += 1
          end
        end
      end
    end
  end
  puts ans
end
