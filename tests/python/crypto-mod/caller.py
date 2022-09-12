import os
import sys

from aes import decrypt, encrypt
from Crypto.Random import get_random_bytes


def encrypt_msg(plaintext, key):
    encrypt(plaintext, key)
    assert plaintext == decrypt(key), "Original data does not match the result"


if __name__ == "__main__":
    key = os.getenv("KEY") or get_random_bytes(32)  # Use a stored / generated key
    encrypt_msg(str.encode(sys.argv[1]), key)
