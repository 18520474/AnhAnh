import cv2
import numpy as np
img = cv2.imread("pika.png")
b,g,r = cv2.split(img)
Red = open("Red.txt", "w")
Green = open("Green.txt", "w")
Blue = open("Blue.txt", "w")
for i in r:
    np.savetxt(Red,i,fmt='%d')
for j in g:
    np.savetxt(Green,j,fmt='%d')
for k in b:
    np.savetxt(Blue,k,fmt='%d')