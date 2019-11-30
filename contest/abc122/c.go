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

func main() {
	nq := readIntArray()
	n := nq[0]
	q := nq[1]
	s := readLine()

	var acSum [100005]int
	cnt := 0
	prevA := false
	for j := 0; j < n; j++ {
		if prevA && s[j] == 'C' {
			cnt++
		}
		acSum[j] = cnt
		if s[j] == 'A' {
			prevA = true
		} else {
			prevA = false
		}
	}
	for i := 0; i < q; i++ {
		lr := readIntArray()
		l := lr[0] - 1
		r := lr[1] - 1
		ans := acSum[r] - acSum[l]
		fmt.Println(ans)
	}
}
