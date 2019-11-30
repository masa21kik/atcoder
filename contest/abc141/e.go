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

func main() {
	n := nextInt()
	s := nextWord()
	var i, j int

	var dp [5005][5005]int

	// dp := make([][]int, n+1)
	// for i = 0; i <= n; i++ {
	// 	dp[i] = make([]int, n+1)
	// }

	var ans int
	for j = n - 1; j >= 0; j-- {
		for i = j - 1; i >= 0; i-- {
			if s[i] == s[j] {
				dp[i][j] = dp[i+1][j+1] + 1
				if i+dp[i][j] <= j && ans < dp[i][j] {
					ans = dp[i][j]
				}
			}
		}
	}
	fmt.Println(ans)
}
