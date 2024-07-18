#!/usr/bin/env python3
"""
Cache class Module excercise
"""
import redis
from uuid import uuid4
from typing import Union, Callable, TypeVar


class Cache:
    """
    Cache class
    """

    def __init__(self):
        """
        store an instance
        of the Redis client as a private
        variable named _redis
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
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

    def get(self, key: str, fn: Callable) -> None | TypeVar:
        """
        simulation to redis.get()
        """
        if not key:
            return None
        return fn(self._redis.get((key)))

    def get_str(self, key: str) -> str:
        """
        convert bytes format to string
        """
        return (self._redis.get(key)).decode('utf-8')

    def get_int(self, key: str) -> str:
        """
        convert bytes format to string
        """
        value = self._redis.get(key)
        try:
            value = int(value.decode('utf-8'))
        except Exception:
            value = 0
        return value
