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
	X := a[0]
	Y := a[1]

	var ans int
	if X == 3 {
		ans += 100000
	}
	if X == 2 {
		ans += 200000
	}
	if X == 1 {
		ans += 300000
	}
	if Y == 3 {
		ans += 100000
	}
	if Y == 2 {
		ans += 200000
	}
	if Y == 1 {
		ans += 300000
	}
	if X == 1 && Y == 1 {
		ans += 400000
	}
	fmt.Println(ans)
}
