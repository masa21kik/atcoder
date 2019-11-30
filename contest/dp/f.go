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
	sc.Split(bufio.ScanWords)
	s := nextWord()
	t := nextWord()

	var dp [3005][3005][]byte
	var mbyte []byte
	var mlen = 0
	tlen := len(t)
	slen := len(s)

	var emptyByte = make([]byte, 0, 1)
	for i := 0; i < tlen; i++ {
		for j := 0; j < slen; j++ {
			if t[i] == s[j] {
				if i == 0 || j == 0 {
					dp[i][j] = append(emptyByte, t[i])
				} else {
					dp[i][j] = append(dp[i-1][j-1], t[i])
				}
				if len(dp[i][j]) > mlen {
					mlen = len(dp[i][j])
					mbyte = dp[i][j]
				}
			} else {
				if i == 0 && j == 0 {
				} else if j == 0 {
					dp[i][j] = dp[i-1][j]
				} else if i == 0 {
					dp[i][j] = dp[i][j-1]
				} else {
					if len(dp[i-1][j]) > len(dp[i][j-1]) {
						dp[i][j] = dp[i-1][j]
					} else {
						dp[i][j] = dp[i][j-1]
					}
				}
			}
		}
	}

	fmt.Println(string(mbyte))
}
