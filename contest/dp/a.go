package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
)

var sc = bufio.NewScanner(os.Stdin)

func nextWord() string {
	sc.Scan()
	return sc.Text()
}

func nextInt() int {
	i, e := strconv.Atoi(nextWord())
	if e != nil {
		panic(e)
	}
	return i
}

func abs(v int) int {
	if v < 0 {
		return -v
	}
	return v
}

func min(v1, v2 int) int {
	if v1 < v2 {
		return v1
	}
	return v2
}

func main() {
	var dp [100005]int

	sc.Split(bufio.ScanWords)
	n := nextInt()
	var h []int
	for i := 0; i < n; i++ {
		h = append(h, nextInt())
		dp[i] = math.MaxInt32
	}

	dp[0] = 0
	dp[1] = abs(h[0] - h[1])
	for i := 2; i < n; i++ {
		dp[i] = min(dp[i-1]+abs(h[i-1]-h[i]), dp[i-2]+abs(h[i-2]-h[i]))
	}
	ans := dp[n-1]
	fmt.Println(ans)
}
