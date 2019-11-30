package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

var rdr = bufio.NewReaderSize(os.Stdin, 1024)

func readLine() string {
	buf := make([]byte, 0, 1024)
	for {
		l, p, e := rdr.ReadLine()
		if e != nil {
			panic(e)
		}
		buf = append(buf, l...)
		if !p {
			break
		}
	}
	return string(buf)
}

func atoi(s string) int {
	i, e := strconv.Atoi(s)
	if e != nil {
		panic(e)
	}
	return i
}

func readStringArray() []string {
	return strings.Split(strings.TrimSpace(readLine()), " ")
}

func readInt() int {
	return atoi(readLine())
}

func readIntArray() []int {
	var a []int
	sa := readStringArray()
	for _, s := range sa {
		a = append(a, atoi(s))
	}
	return a
}

func powIntMod(x, y, mod int) int {
	var res = 1
	for i := 0; i < y; i++ {
		res *= x
		res %= mod
	}
	return res
}

func main() {
	N := readInt()
	var ans int

	// A=0, C=1, G=2, T=3
	// dp[n文字][3文字前][2文字前][1文字前] = OK数
	// ?021, ?201, ?012, 0?21, 02?1 がNG
	var dp [105][4][4][4]int
	var mod int = 1000000007
	// 3は制約なし．文字列は333Sだと思って問題ない
	dp[0][3][3][3] = 1
	for n := 0; n < N; n++ {
		for i := 0; i < 4; i++ {
			for j := 0; j < 4; j++ {
				for k := 0; k < 4; k++ {
					for a := 0; a < 4; a++ {
						if (j == 0 && k == 2 && a == 1) ||
							(j == 2 && k == 0 && a == 1) ||
							(j == 0 && k == 1 && a == 2) ||
							(i == 0 && k == 2 && a == 1) ||
							(i == 0 && j == 2 && a == 1) {
							continue
						}
						dp[n+1][j][k][a] += dp[n][i][j][k]
						dp[n+1][j][k][a] %= mod
					}
				}
			}
		}
	}
	for i := 0; i < 4; i++ {
		for j := 0; j < 4; j++ {
			for k := 0; k < 4; k++ {
				ans += dp[N][i][j][k]
				ans %= mod
			}
		}
	}
	fmt.Println(ans)
}
