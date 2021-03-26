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

print(y)

base = 0
python_video = np.zeros((y , x))
rtl_video = np.zeros((y , x))
print(python_video.shape)
###############
Compare = open("text/compare_vid.txt", "w")
sum_avg = 0
max_all = 0
min_all =  float('inf')
##############
for i in range(number):
    python_path = "video/text/gray/gray_" + str(i) + ".txt"
    rtl_path    = "video/text/Result/Result_" + str(i) + ".txt"
    python_frame = open(python_path, "r")
    rtl_frame    = open(rtl_path, "r")
##################
    count = 0
    sum = 0
    max = 0
    min =  float('inf')
    Compare.write("---------Frame: " + str(i) + '\n')
####################
    for y_ in range(y):
        for j in range(x):
            python_frame_line   = python_frame.readline()
            rtl_frame_line      = rtl_frame.readline()
            ##############
            test = (abs(bin_to_float(python_frame_line) - bin_to_float(rtl_frame_line)))
            sum = sum + test
            if (max < test):
                max = test
            if (min > test):
                min = test
            count = count + 1
            ###############
            python_video[y_][j]  = copy.copy(bin_to_float(python_frame_line))
            rtl_video[y_][j]     = copy.copy(bin_to_float(rtl_frame_line))
            ###############
            ###############
    python_frame.close()
    rtl_frame.close()
    cv2.imshow("python video", python_video)
    cv2.imshow("RTL video", rtl_video)
    status(number, i)
    Compare.write("Sai so lon nhat " + str(max) + '\n')
    Compare.write("Sai so nho nhat " + str(min) + '\n')
    Compare.write("Sai so trung binh " + str(sum/count) + '\n')
    sum_avg = sum_avg + sum/count
    if (max_all < max):
        max_all = max
    if (min_all > min):
        min_all = min
    if cv2.waitKey(25) & 0xFF == ord('q') : # press Q to exit
        break 
Compare.write("--------------FINAL--------------" + '\n')
Compare.write("SAI SO LON NHAT " + str(max_all) + '\n')
Compare.write("SAI SO NHO NHAT " + str(min_all) + '\n')
Compare.write("SAI SO TRUNG BINH" + str(sum_avg/number) + '\n')
Compare.write("--------------******--------------" + '\n')
cv2.destroyAllWindows()