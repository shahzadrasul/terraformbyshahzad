     
#!/usr/bin/env python3
from PIL import Image
image = Image.open('houseimage.jpeg')
image.save('houseimage-noexifnew.jpeg')
