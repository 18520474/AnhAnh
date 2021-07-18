from cv2 import cv2

import numpy as np
import struct

def bin_to_float(binary):
    return struct.unpack('!f', struct.pack('!I', int(binary, 2)))[0]


rtl = open("result.txt", "r")
float_convert = open("affer_convert.txt", "w")

rtl_line = rtl.readline()
while (rtl_line != ""):
    if(rtl_line.find("index") != -1):
        float_convert.write(rtl_line)
    else:
        float_convert.write(str(bin_to_float(rtl_line)) + '\n')
    rtl_line = rtl.readline()

rtl.close()
float_convert.close()
print("done !")



