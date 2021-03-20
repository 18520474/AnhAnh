import numpy as np
import time
import struct
from cv2 import cv2

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')
def rgb_to_grayscale(r, g, b):
    G = (0.2989*r + 0.5870*g + 0.1140*b) / 255
    return G
def save_info(x, y, number):
    info = "video/text/info.txt" 
    info = open(info, "w")
    info.write("x = " + str(x) + '\n' + "y = " + str(y) + '\n' + "total frame = " + str(number))
def save_img(x, y, number, r, g, b, gray):
    blue_file_name  = "video/text/blue/blue_"   + str(number) + ".txt" 
    green_file_name = "video/text/green/green_" + str(number) + ".txt" 
    red_file_name   = "video/text/red/red_"     + str(number) + ".txt" 
    gray_file_name  = "video/text/gray/gray_"   + str(number) + ".txt" 
    Green = open(green_file_name, "w")
    Blue  = open(blue_file_name,  "w")
    Red   = open(red_file_name,   "w")
    Gray  = open(gray_file_name,  "w")
    for i in range(y):
        for j in range(x):
            Green.write(np.binary_repr(g[i][j], width=8) + '\n')            #write Green.txt
            Red.write(np.binary_repr(r[i][j], width=8)   + '\n')            #write Red.tx
            Blue.write(np.binary_repr(b[i][j], width=8)  + '\n')            #write Blue.txt
            Gray.write(float_to_bin(gray[i][j])          + '\n')            #write Gray.txt
    print("frame" + str(number) + " --> done")

cap = cv2.VideoCapture("video/source/one_punch.mp4")
if (cap.isOpened() == False):
    print("video open fail")
else:
    number = 0
    ret, frame = cap.read()
    y, x, _ = frame.shape
    while(True):
        if ret == True:
            b,g,r = cv2.split(frame)
            grayscale_frame = rgb_to_grayscale(r, g, b) 
            cv2.imshow('origin video', frame)
            cv2.imshow('grayscale video', grayscale_frame)
            save_img(x, y, number, r, g, b, grayscale_frame)
            number = number + 1
            ret, frame = cap.read()
            if cv2.waitKey(25) & 0xFF == ord('q') : # press Q to exit
                break 
        else:
            save_info(x, y, number)
            break
cap.release()
cv2.destroyAllWindows()