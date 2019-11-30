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
	a := readIntArray()
	n := a[0]
	k := a[1]
	s := readLine()

	var r []int
	if s[0] == '0' {
		// 番兵
		r = append(r, 0)
	}
	prev := s[0]
	l := 1
	for i := 1; i < n; i++ {
		if prev != s[i] {
			r = append(r, l)
			l = 0
		}
		prev = s[i]
		l++
	}
	if l > 0 {
		r = append(r, l)
	}
	w := k*2 + 1
	var ans int
	lenR := len(r)
	// init
	for j := 0; j < w; j++ {
		if j >= lenR {
			break
		}
		ans += r[j]
	}
	// search
	prevM := ans
	for i := 2; i < lenR; i += 2 {
		m := prevM - r[i-2] - r[i-1]
		for j := w - 2; j < w; j++ {
			if i+j >= lenR {
				break
			}
			m += r[i+j]
		}
		if m > ans {
			ans = m
		}
		prevM = m
	}

	fmt.Println(ans)
}
