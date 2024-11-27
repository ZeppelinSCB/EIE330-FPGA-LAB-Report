import numpy as np
from PIL import Image
from matplotlib.colors import rgb2hex

SOURCE = 'Nagato.jpg' # Source image file
SIZE = (640, 480) # Desired size of the image array

# Load and resize the image
img = Image.open(SOURCE)
img = img.resize(SIZE, resample=2)
img = img.convert('RGB')

# Convert RGB to Hex Color
[ rgb2hex(img[i,:]) for i in range(img.shape[0]) ] # in each row, rgb to hex
