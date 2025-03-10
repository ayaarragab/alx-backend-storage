#!/usr/bin/env python3
"""
a Python script that provides some
statsabout Nginx logs stored in MongoDB:
"""
from pymongo import MongoClient


if __name__ == '__main__':
    client = MongoClient('mongodb://127.0.0.1:27017')
    collection = client.logs.nginx
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    x = collection.count_documents({})
    print(f'{x} logs')
    print('Methods:')
    for method in methods:
        count = collection.count_documents({"method": method})
        print(f'\tmethod {method}: {count}')

    d = collection.count_documents(
        {"method": "GET", "path": "/status"}
    )
    print(f'{d} status check')
