from fastapi import FastAPI
import redis

app = FastAPI()

# Connect to Redis
redis_client = redis.StrictRedis(host="localhost", port=6379, decode_responses=True)

@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

@app.get("/set/{key}/{value}")
def set_value(key: str, value: str):
    redis_client.set(key, value)
    return {"message": f"Set {key} to {value}"}

@app.get("/get/{key}")
def get_value(key: str):
    value = redis_client.get(key)
    if value is None:
        return {"message": f"{key} not found"}
    return {"message": f"{key} is {value}"}
