import struct
import numpy as np
from cv2 import cv2

def bin_to_float(binary):
    return struct.unpack('!f', struct.pack('!I', int(binary, 2)))[0]
info = open("video/text/info.txt", "r")
x      = int(info.readline()[4:])
y      = int(info.readline()[4:])
number = int(info.readline()[14:])

base = 0

rtl_video = np.zeros((x , y))
for i in range(number):
    name = "video/text/gray/gray_" + str(i) + ".txt"
    print(name)
    frame = open("name", "r")
    for y in range(x):
        for j in range(y):
            python_frame_line   = frame.readline()
            python_video[i][j]  = bin_to_float(python_frame_line)
    cv2.imshow("python video", python_video)
    if cv2.waitKey(25) & 0xFF == ord('q') : # press Q to exit
        break 
cv2.destroyAllWindows()