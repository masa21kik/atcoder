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
	n := 5
	var pos []int
	for i := 0; i < n; i++ {
		pos = append(pos, readInt())
	}
	k := readInt()

	for i := 0; i < n-1; i++ {
		for j := i + 1; j < n; j++ {
			if pos[j]-pos[i] > k {
				fmt.Println(":(")
				os.Exit(0)
			}
		}
	}
	fmt.Println("Yay!")
}
