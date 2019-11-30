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
	var dp [100005][3]int
	sc.Split(bufio.ScanWords)
	n := nextInt()
	var abc [3][]int
	for i := 0; i < n; i++ {
		abc[0] = append(abc[0], nextInt())
		abc[1] = append(abc[1], nextInt())
		abc[2] = append(abc[2], nextInt())
	}

	for j := 0; j < 3; j++ {
		dp[0][j] = abc[j][0]
	}

	for i := 1; i < n; i++ {
		dp[i][0] = max(dp[i-1][1]+abc[0][i], dp[i-1][2]+abc[0][i])
		dp[i][1] = max(dp[i-1][0]+abc[1][i], dp[i-1][2]+abc[1][i])
		dp[i][2] = max(dp[i-1][0]+abc[2][i], dp[i-1][1]+abc[2][i])
	}

	ans := max(max(dp[n-1][0], dp[n-1][1]), dp[n-1][2])
	fmt.Println(ans)
}
