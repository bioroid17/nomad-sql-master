import sqlite3

conn = sqlite3.connect("users.db")

cur = conn.cursor()


def init_table():
    cur.execute(
        """
    CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL
    );
"""
    )
    cur.execute(
        """
    INSERT INTO users (username, password) VALUES
    ('nico', '123'), ('lynn', '321');
"""
    )


def print_all_users():
    res = cur.execute("SELECT * FROM users;")
    data = res.fetchall()
    print(data)


print_all_users()

conn.commit()
conn.close()
