#!/bin/bash
# Start nginx in the background
nginx &

# Start Python HTTP server in the background
python3 -m http.server 8080 &

# Wait for any process to exit
wait -n

# Exit with the status of the process that exited first
exit $?
