#!/usr/bin/env python3
"""
8. List all documents in Python
"""
from pymongo import MongoClient


def list_all(mongo_collection):
    """
    8. List all documents in Python
    """
    client = MongoClient("mongodb://localhost:27017/")
    print(mongo_collection.find())
