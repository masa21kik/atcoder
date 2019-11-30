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

func min(v1, v2 int) int {
	if v1 < v2 {
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

	vMax := 100 * 1000
	// init
	for i := 0; i < n; i++ {
		for sumV := 0; sumV <= vMax; sumV++ {
			dp[i][sumV] = math.MaxInt32
		}
	}
	dp[0][0] = 0

	// i番目の品物
	for i := 0; i < n; i++ {
		for sumV := 0; sumV <= vMax; sumV++ {
			if sumV >= v[i] {
				dp[i+1][sumV] = min(dp[i][sumV], dp[i][sumV-v[i]]+w[i])
			}
			dp[i+1][sumV] = min(dp[i+1][sumV], dp[i][sumV])
		}
	}
	var ans int
	for sumV := vMax; sumV >= 0; sumV-- {
		if dp[n][sumV] <= ww {
			ans = sumV
			break
		}
	}
	fmt.Println(ans)
}
