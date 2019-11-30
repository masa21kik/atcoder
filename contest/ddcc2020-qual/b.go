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

func abs(v int) int {
	if v > 0 {
		return v
	}
	return -v
}

func main() {
	N := readInt()
	A := readIntArray()
	l := 0
	var m []int
	for i := 0; i < N; i++ {
		l += A[i]
		m = append(m, l)
	}
	dist := l
	for i := 0; i < N; i++ {
		d := abs(m[i]*2 - l)
		if d < dist {
			dist = d
		}
	}
	fmt.Println(dist)
}
