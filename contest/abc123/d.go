package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
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

func min(lhs, rhs int) int {
	if lhs < rhs {
		return lhs
	}
	return rhs
}

func max(lhs, rhs int) int {
	if lhs > rhs {
		return lhs
	}
	return rhs
}

func main() {
	xyzk := readIntArray()
	x := xyzk[0]
	y := xyzk[1]
	z := xyzk[2]
	k := xyzk[3]
	a := readIntArray()
	b := readIntArray()
	c := readIntArray()
	var abScore []int
	for i := 0; i < x; i++ {
		for j := 0; j < y; j++ {
			abScore = append(abScore, a[i]+b[j])
		}
	}
	sort.Ints(abScore)
	var abcScore []int
	cnt := 0
	for i := len(abScore) - 1; i >= 0; i-- {
		for j := 0; j < z; j++ {
			abcScore = append(abcScore, abScore[i]+c[j])
		}
		cnt++
		if cnt > k {
			break
		}
	}
	sort.Ints(abcScore)
	cnt = 0
	for i := len(abcScore) - 1; i >= 0; i-- {
		fmt.Println(abcScore[i])
		cnt++
		if cnt >= k {
			break
		}
	}
}
