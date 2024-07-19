#!/usr/bin/env python3
"""
Python function that inserts
a new document in a collection based on kwarg
"""


def insert_school(mongo_collection, **kwargs):
    """
    Python function that inserts
    a new document in a collection based on kwarg
    """
    return mongo_collection.insert_many(kwargs)
