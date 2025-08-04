import sqlite3

conn = sqlite3.connect("../movies_download.db")

cur = conn.cursor()

res = cur.execute("SELECT movie_id, title FROM movies")

# all_movies = res.fetchall()

# first_20 = res.fetchmany(20)
# next_20 = res.fetchmany(20)

# print(res.fetchone(), res.fetchone(), res.fetchone(), res.fetchone(), res.fetchone())

for movie in res:
    print(movie)

conn.commit()
conn.close()
