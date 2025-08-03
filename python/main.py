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


def i_change_password(username, new_password):
    cur.execute(
        f"UPDATE users SET password = '{new_password}' WHERE username = '{username}'"
    )


def s_change_password(username, new_password):
    cur.execute(
        "UPDATE users SET password = ? WHERE username = ?",
        (new_password, username),
    )


data = [
    ("lannna", 567),
    ("bora", 123),
    ("max", 123),
    ("jja", 898),
]

# cur.executemany("INSERT INTO users (username, password) VALUES (?, ?)", data)

data = [
    {"name": "lannna", "password": 567},
    {"name": "bora", "password": 123},
    {"name": "max", "password": 123},
    {"name": "jja", "password": 898},
]

cur.executemany(
    "INSERT INTO users (username, password) VALUES (:name, :password)",
    data,
)

print_all_users()

conn.commit()
conn.close()
