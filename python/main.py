from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")

database = client.get_database("movies")
movies = database.get_collection("movies")

# query = {"director": "Christopher Nolan"}
# query = {"rating": {"$gte": 8.0}}

# results = movies.find(query)

# for movie in results:
#     print(movie)

new_movie = {
    "title": "New movie",
    "director": "New director",
}

result = movies.insert_one(new_movie)

print(result)

client.close()
