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

func max(lhs, rhs int) int {
	if lhs > rhs {
		return lhs
	}
	return rhs
}

func main() {
	a := readIntArray()
	X := a[0]
	Y := a[1]
	MOD := 1000000007

	if (Y+X)%3 != 0 || Y > 2*X || 2*Y < X {
		fmt.Println(0)
		os.Exit(0)
	}
	// K = (Y + X) / 3
	L := (2*Y - X) / 3
	M := -(Y - 2*X) / 3

	var dp [333339][333339]int
	fmt.Println("start")
	for i := 0; i <= max(L, M); i++ {
		dp[i][0] = 1
		dp[0][i] = 1
	}
	for i := 1; i <= L; i++ {
		for j := 1; j <= M; j++ {
			dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % MOD
		}
	}
	fmt.Println(dp[L][M] % MOD)
}
