package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

var sc = bufio.NewScanner(os.Stdin)

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

func main() {
	sc.Split(bufio.ScanWords)
	n := nextInt()
	s := nextWord()
	var a []int
	var l []string
	for i := 0; i < n; i++ {
		l = append(l, nextWord())
		a = append(a, nextInt())
	}
	fmt.Println(n, s, l, a)

	var ans int
	fmt.Println(ans)
}
