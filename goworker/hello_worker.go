package main

import (
	"fmt"
	"github.com/benmanns/goworker"
)

func init() {
	goworker.Register("HelloGo", helloWorker)
}

func helloWorker(queue string, args ...interface{}) error {
	fmt.Println("Hello from go")
	return nil
}
