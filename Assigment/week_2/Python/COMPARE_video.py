import struct
import time
import numpy as np
import copy
from cv2 import cv2

def status(y, i):
    percent = (i / y) * 100
    print("procesing " + str(int(percent)) + '% Pess Q to stop')

def bin_to_float(binary):
    return struct.unpack('!f', struct.pack('!I', int(binary, 2)))[0]
info = open("video/text/info.txt", "r")
x      = int(info.readline()[4:])
y      = int(info.readline()[4:])
number = int(info.readline()[14:])

print(x)

base = 0
python_video = np.zeros((y , x))
rtl_video = np.zeros((y , x))
print(python_video.shape)
for i in range(number):
    python_path = "video/text/gray/gray_" + str(i) + ".txt"
    rtl_path    = "video/text/gray/gray_" + str(i) + ".txt"
    python_frame = open(python_path, "r")
    rtl_frame    = open(rtl_path, "r")
    for y_ in range(y):
        for j in range(x):
            python_frame_line   = python_frame.readline()
            rtl_frame_line      = rtl_frame.readline()
            python_video[y_][j]  = copy.copy(bin_to_float(python_frame_line))
            rtl_video[y_][j]     = copy.copy(bin_to_float(rtl_frame_line))
    python_frame.close()
    rtl_frame.close()
    cv2.imshow("python video", python_video)
    cv2.imshow("RTL video", rtl_video)
    status(number, i)
    if cv2.waitKey(25) & 0xFF == ord('q') : # press Q to exit
        break 
cv2.destroyAllWindows()