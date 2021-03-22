#   AnhAnh
from cv2 import cv2
import numpy as np
import struct
import fire
import copy

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')
def rgb_to_grayscale(r, g, b):
    G = (0.2989*r + 0.5870*g + 0.1140*b) / 255
    return G
def status(y, i):
    tmp =  int(y / 10)
    if(i % tmp == 0):
        percent = (i / tmp) * 10
        print("procesing " + str(percent) + '%')
def printimg(img):
    img   = cv2.imread(img)
    b,g,r = cv2.split(img)
    gray_img = rgb_to_grayscale(r, g, b)    #calulate gray img

    Green = open("text/Green.txt", "w")
    Blue  = open("text/Blue.txt" , "w")
    Red   = open("text/Red.txt"  , "w")
    Gray  = open("text/Gray.txt" , "w")

    y, x, _ = img.shape            #get x, y resolusion
    gray_img = np.array(gray_img)  #create numpy array for storing gray img 
    for i in range(y):
        for j in range(x):
            Green.write(np.binary_repr(copy.copy(g[i][j]), width=8) + '\n')             #write Green.txt
            Red.write(  np.binary_repr(copy.copy(r[i][j]), width=8) + '\n')             #write Red.txt
            Blue.write( np.binary_repr(copy.copy(b[i][j]), width=8) + '\n')             #write Blue.txt
            Gray.write(float_to_bin(copy.copy(gray_img[i][j])) + '\n')                  #write Gray.txt
        status(y, i)                                                        #print process status
    if (x > 400) and (y > 400):
        cv2.imshow('origin', cv2.resize(img,      (400,400), interpolation = cv2.INTER_AREA))
        cv2.imshow('result', cv2.resize(gray_img, (400,400), interpolation = cv2.INTER_AREA))
    else:
        cv2.imshow('origin', img)
        cv2.imshow('result', gray_img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
if __name__ == '__main__':
    fire.Fire(printimg)
