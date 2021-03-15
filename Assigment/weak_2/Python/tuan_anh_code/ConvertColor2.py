import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

#def rgb2gray(rgb):
#    return np.dot(rgb[...,:3], [0.2989, 0.5870, 0.1140])

img = mpimg.imread('Result.png')
#gray = rgb2gray(img)        
#plt.imshow(gray, 'gray')
#print(len(gray))
convert = open("Bin2.txt", "w")
for i in range(len(img)):
    for j in range(len(img[0])):
        convert.write(str(img[i][j])+ "\n")
#plt.show()

