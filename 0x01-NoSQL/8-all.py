#!/usr/bin/env python3
"""
8. List all documents in Python
"""


def list_all(mongo_collection):
    """
    8. List all documents in Python
    """
    documents = mongo_collection.find()

    if documents.count() == 0:
        return []

    return documents
