#!/usr/bin/env bash

host=127.0.0.1
port=8888

while true; do
body=$(cat <<EOF
<!doctype html>
<html>
<meta http-equiv="refresh" content="1">
<body>
<h1>netcat webpage</h1>
Date: $(date)
</body>
</html>
EOF
)

response=$(cat <<EOF
HTTP/1.0 200 OK

$body
EOF
)
echo "---$((x=x+1))---"
echo "$response" | nc -l $host $port
done