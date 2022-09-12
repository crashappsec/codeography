import os

from aes import decrypt, encrypt
from Crypto.Random import get_random_bytes


def encrypt_msg():
    plaintext = b"hey there"
    key = os.getenv("KEY") or get_random_bytes(32)  # Use a stored / generated key
    encrypt(plaintext, key)
    assert plain == decrypt(key), "Original data does not match the result"
