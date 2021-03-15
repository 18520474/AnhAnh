import cv2
import numpy as np
img = cv2.imread("pika.png")
b,g,r = cv2.split(img)
Red = open("Red.txt", "w")
Green = open("Green.txt", "w")
Blue = open("Blue.txt", "w")
for i in r:
    for j in i:
        Red.write(np.binary_repr(j, width=8) + '\n')
for i in g:
    for j in i:
        Green.write(np.binary_repr(j, width=8) + '\n')
for i in b:
    for j in i:
        Blue.write(np.binary_repr(j, width=8) + '\n')