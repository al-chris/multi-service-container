#!/bin/bash
# Start Redis server in the background
redis-server &

# Start the FastAPI app using uvicorn
uvicorn app.main:app --host 0.0.0.0 --port 8000 &
 
# Wait for any process to exit
wait -n

# Exit with the status of the process that exited first
exit $?
