package main

import (
	"fmt"
	"net/http"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	currentTime := time.Now().Format("2006-01-02 15:04:05")

	w.Header().Set("Content-Type", "text/html; charset=utf-8")

	fmt.Fprintf(w, `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="1">
    <title>HelloGo</title>
</head>
<body>
    <h1>shalom, world!</h1>
    <p>Current time: %s</p>
</body>
</html>
`, currentTime)
}

func main() {
	http.HandleFunc("/", handler)

	fmt.Println("Server started on port 8080")
	http.ListenAndServe(":8080", nil)
}