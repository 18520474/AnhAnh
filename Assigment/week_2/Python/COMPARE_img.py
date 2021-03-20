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

Gray     = open("text/Gray.txt", "r")
Gray_RTL = open("text/Result.txt", "r")
x = 1155
y = 1024
python_img  = np.zeros((x , y))
rtl_img     = np.zeros((x , y))

for i in range(x):
    for j in range(y):
        python_line       = Gray.readline()
        rtl_line          = Gray_RTL.readline()
        python_img[i][j]  = bin_to_float(python_line)
        rtl_img[i][j]     = bin_to_float(rtl_line)
    status(x, i)

if (x > 400) and (y > 400):
    cv2.imshow('Python', cv2.resize(python_img, (400,400), interpolation = cv2.INTER_AREA))
    cv2.imshow('RTL',    cv2.resize(rtl_img,    (400,400), interpolation = cv2.INTER_AREA))
else:
    cv2.imshow('Python', python_img)
    cv2.imshow('RTL', rtl_img)

cv2.waitKey(0)
cv2.destroyAllWindows()



