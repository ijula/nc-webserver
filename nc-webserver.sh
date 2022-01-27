#!/usr/bin/env bash

declare -r host='127.0.0.1'
declare -r port='8888'

while true; do
body="$(cat <<EOF
<!doctype html>
<html>
<meta http-equiv="refresh" content="1">
<body>
Date: $(date)
<br>
<pre>
Top: $(top -b -n 1)
</pre>
</body>
</html>
EOF
)"

response="$(cat <<EOF
HTTP/1.0 200 OK

$body
EOF
)"

echo "--- $((x=x+1)) ---"
echo "$response" | nc -l "$host" "$port"
done
