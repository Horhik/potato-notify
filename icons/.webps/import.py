import os
import glob
from PIL import Image
curdir = os.path.dirname(os.path.realpath(__file__))
images = glob.glob("*.webp")

for i in images:
    img = Image.open(i).convert('RGBA')
    img.save(i + "conv.png", 'png')

