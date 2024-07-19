#!/usr/bin/env python3
"""
Python function that changes all topics
of a school document based on the name
"""


def update_topics(mongo_collection, name, topics):
    """
    Python function that changes all topics
    of a school document based on the name
    """
    myquery = { "name": name }
    newValues = {'$set':{'topics':topics}}
    mongo_collection.updateMany(myquery, newValues)
