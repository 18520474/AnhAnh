from cv2 import cv2
import numpy as np
import struct
import fire

def bin_to_float(binary):
    return struct.unpack('!f', struct.pack('!I', int(binary, 2)))[0]
def status(y, i):
    tmp =  int(y / 10)
    if(i % tmp == 0):
        percent = (i / tmp) * 10
        print("procesing " + str(percent) + '%')

def printimg(rtl_txt_path, python_txt_path):
    Gray    = open(python_txt_path, "r")
    Gray_RTL= open(rtl_txt_path, "r")
    x = 1155
    y = 1024
    img = np.zeros((x , y))
    img2 = np.zeros((x , y))
    for i in range(x):
        for j in range(y):
            line = Gray.readline()
            line2 = Gray_RTL.readline()
            img[i][j] = bin_to_float(line)
            img2[i][j] = bin_to_float(line2)
        status(x, i)

    if (x > 400) and (y > 400):
        cv2.imshow('Python', cv2.resize(img, (400,400), interpolation = cv2.INTER_AREA))
        cv2.imshow('RTL', cv2.resize(img2, (400,400), interpolation = cv2.INTER_AREA))
    else:
        cv2.imshow('Python', img)
        cv2.imshow('RTL', img2)

    cv2.waitKey(0)
    cv2.destroyAllWindows()

if __name__ == '__main__':
    fire.Fire(printimg)



