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
Gray_RTL = open("/home/tuananh/Desktop/AnhAnh/Assigment/week_2/Result/text/Result.txt", "r")
Compare  = open("text/compare_img.txt", "w")
x = 880
y = 564
python_img  = np.zeros((x , y))
rtl_img     = np.zeros((x , y))
count = 0
sum = 0
max = 0
min =  float('inf')

for i in range(x):
    for j in range(y):
        python_line       = Gray.readline()
        rtl_line          = Gray_RTL.readline()
        test = (abs(bin_to_float(python_line) - bin_to_float(rtl_line)))
        sum = sum + test
        if (max < test):
            max = test
        if (min > test):
            min = test
        #Compare.write(str(test) + '\n')
        count = count + 1
        python_img[i][j]  = bin_to_float(python_line)
        rtl_img[i][j]     = bin_to_float(rtl_line)
    status(x, i)
Compare.write("Sai so lon nhat " + str(max) + '\n')
Compare.write("Sai so nho nhat " + str(min) + '\n')
Compare.write("Sai so trung binh " + str(sum/count) + '\n')
Compare.close()
if (x > 400) and (y > 400):
    cv2.imshow('Python', cv2.resize(python_img, (400,400), interpolation = cv2.INTER_AREA))
    cv2.imshow('RTL',    cv2.resize(rtl_img,    (400,400), interpolation = cv2.INTER_AREA))
else:
    cv2.imshow('Python', python_img)
    cv2.imshow('RTL', rtl_img)

#case = Gray.readline()
#case2 = Gray_RTL.readline()
#while case != '':
    #test = (abs(bin_to_float(case) - bin_to_float(case2)))
    #Compare.write(str(test) + '\n')
    #case = Gray.readline()
    #case2 = Gray_RTL.readline()

cv2.waitKey(0)
cv2.destroyAllWindows()



