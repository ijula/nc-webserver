#!/usr/bin/env bash

declare -r host='127.0.0.1'
declare -r port='8888'

while true; do
body="$(cat <<EOF
<!doctype html>
<html>
<meta http-equiv="refresh" content="5">
<body>
$(date)
<br>
<pre>
$(top -b -n 1)
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

echo "--- $((x++)) ---"
echo "http://$host:$port"
echo "$response" | nc -l "$host" "$port"
done
