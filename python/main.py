import redis, sqlite3, json

r = redis.Redis(host="localhost", port=6379, decode_responses=False)

conn = sqlite3.connect("../movies_download.db")
cur = conn.cursor()


def make_expensive_query():
    redis_key = "director:movies"
    cached_result = r.get(redis_key)
    if cached_result:
        print("Cache hit")
        return json.loads(cached_result)
    else:
        print("Cache miss")
        res = cur.execute("SELECT COUNT(*), director FROM movies GROUP BY director;")
        all_rows = res.fetchall()
        r.set(redis_key, json.dumps(all_rows), ex=20)
        return all_rows


v = make_expensive_query()

conn.commit()
conn.close()
r.close()
