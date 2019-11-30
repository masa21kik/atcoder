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

func main() {
	n := 5
	var wt []int
	for i := 0; i < n; i++ {
		wt = append(wt, readInt())
	}
	sort.Slice(wt, func(i, j int) bool { return 10-(wt[i]-1)%10 < 10-(wt[j]-1)%10 })

	var ans int
	for i := 0; i < n; i++ {
		ans += wt[i]
		if i != n-1 && wt[i]%10 != 0 {
			ans += 10 - wt[i]%10
		}
	}
	fmt.Println(ans)
}
