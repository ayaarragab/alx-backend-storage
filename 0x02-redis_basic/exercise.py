#!/usr/bin/env python3
"""
Cache class Module excercise
"""
import redis
from uuid import uuid4
from typing import Union, Callable, TypeVar, Optional
from functools import wraps


def call_history(method: Callable) -> Callable:
    """
    decorator that takes a single method Callable
    argument and returns a Callable
    """
    methodName = method.__qualname__
    inputs = methodName + ":inputs"
    outputs = methodName + ":outputs"

    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """
        function that increments the count for that
        key every time the method is called and returns
        the value returned by the original method.
        """
        self._redis.rpush(inputs, str(*args))
        outut_data = method(*args, **kwargs)
        self._redis.rpush(outputs, outut_data)
        return outut_data
    return wrapper


def count_calls(method: Callable) -> Callable:
    """
    decorator that takes a single method Callable
    argument and returns a Callable
    """
    @wraps(method)
    def increment(self, *args, **kwargs):
        """
        function that increments the count for that
        key every time the method is called and returns
        the value returned by the original method.
        """
        key = method.__qualname__
        self._redis.incr(key)
        return method(self, *args, **kwargs)
    return increment


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

    @call_history
    @count_calls
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

    def get(self, key: str, fn: Optional[Callable]
            = None) -> Union[str, bytes, int, float]:
        """
        simulation to redis.get()
        """
        if not key:
            return None
        value = self._redis.get(key)
        if fn:
            value = fn(value)
        return value

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
