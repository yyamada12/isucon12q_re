package main

import (
	"fmt"
	"net/http"
	_ "net/http/pprof"

	"github.com/felixge/fgprof"
	isuports "github.com/isucon/isucon12-qualify/webapp/go"
)

func main() {
	http.DefaultServeMux.Handle("/debug/fgprof", fgprof.Handler())
	go func() {
		fmt.Println(http.ListenAndServe("localhost:6060", nil))
	}()

	isuports.Run()
}
