package main

import (
	"bufio"
	"fmt"
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

func max(v1, v2 int) int {
	if v1 > v2 {
		return v1
	}
	return v2
}

func main() {
	var dp [105][100005]int

	sc.Split(bufio.ScanWords)
	n := nextInt()
	ww := nextInt()
	var w, v []int
	for i := 0; i < n; i++ {
		w = append(w, nextInt())
		v = append(v, nextInt())
	}

	// i番目の品物
	for i := 0; i < n; i++ {
		for j := 0; j <= ww; j++ {
			if j >= w[i] {
				dp[i+1][j] = max(dp[i][j], dp[i][j-w[i]]+v[i])
			} else {
				dp[i+1][j] = dp[i][j]
			}
		}
	}

	ans := dp[n][ww]
	fmt.Println(ans)
}
