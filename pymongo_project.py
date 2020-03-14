from pymongo import MongoClient

client = MongoClient(
    "mongodb+srv://jon:cecs323@cluster0-v3ant.mongodb.net/test?retryWrites=true&w=majority")

db = client['pymongo']
collection_book = db['book']

post = {
    '_id': 0,
    'name': 'brave new world'
}

collection_book.insert_one(post)
