from cv2 import cv2
from numpy import asarray
import numpy as np
import struct
import copy

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')

img = cv2.imread("testcase/img/9.png")
img = cv2.resize (img, (64,64))
img = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

print(img[34][56])

my_txt = open("testcase/txt/9.txt", "w")
for i in range(64):
    for j in range(64):
        my_txt.write(float_to_bin(img[i][j]) + '\n')
my_txt.close()
print("done")

