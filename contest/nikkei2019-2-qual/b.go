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

func Pow(x, y, mod int64) int64 {
	var ret int64 = 1
	var i int64
	for i = 0; i < y; i++ {
		ret *= x
		ret %= mod
	}
	return ret
}

func main() {
	N := readInt()
	D := readIntArray()
	var MOD int64 = 998244353
	var cnt [100005]int64
	var ans int64
	for i := 0; i < N; i++ {
		cnt[D[i]]++
	}
	if D[0] != 0 || cnt[0] != 1 {
		fmt.Println(0)
		os.Exit(0)
	}
	li := 0
	ans = 1
	for i := 1; i < N; i++ {
		li = i
		if cnt[i] == 0 {
			break
		}
		ans *= Pow(cnt[i-1], cnt[i], MOD)
		ans %= MOD
	}
	for i := li + 1; i < N; i++ {
		if cnt[i] > 0 {
			fmt.Println(0)
			os.Exit(0)
		}
	}
	fmt.Println(ans)
}
