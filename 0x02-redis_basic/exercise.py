#!/usr/bin/env python3
"""
Cache class Module excercise
"""
import redis
from uuid import uuid4
from typing import Union


class Cache:
    """
    Cache class
    """

    def __init__(self: object):
        """
        store an instance
        of the Redis client as a private
        variable named _redis
        """
        self._redis: redis.Redis = redis.Redis()
        self._redis.flushdb()


    @count_calls
    @call_history
    def store(self: object, data: Union[str, bytes, int, float]) -> str:
        """
        store method that takes a data argument
        and returns a string.
        The method should generate a random key (e.g. using uuid)
        store the input data in Redis using the random key
        and return the key.
        """
        key: str = str(uuid4())
        self._redis.set(key, data)
        return key
