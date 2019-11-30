package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

var sc = bufio.NewScanner(os.Stdin)
var rdr = bufio.NewReaderSize(os.Stdin, 1000000)

func readLine() string {
	buf := make([]byte, 0, 1000000)
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

func min(lhs, rhs int64) int64 {
	if lhs < rhs {
		return lhs
	}
	return rhs
}

func main() {
	sc.Split(bufio.ScanWords)
	s := readLine()

	var ans int64

	// count 0
	var cnt0 [2]int64
	var cnt1 [2]int64
	for i := 0; i < len(s); i++ {
		if s[i] == '0' {
			cnt0[i%2]++
		} else {
			cnt1[i%2]++
		}
	}
	// 01010...
	ans0 := cnt0[1] + cnt1[0]
	// 10101...
	ans1 := cnt0[0] + cnt1[1]
	ans = min(ans0, ans1)
	fmt.Println(ans)
}
