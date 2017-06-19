from glob import glob
from os import rename
import os

posts = glob('**/*.md', recursive=True)
for post in posts:
    file_path = os.path.abspath(post)
    print(file_path)
