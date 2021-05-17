import numpy as np 
import cv2
image = cv2.imread('/home/tuananh/Downloads/lena.png')
##b,g,r = cv2.split(image)
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
#cv2.imshow('Original image',image)
#cv2.imshow('Gray image', gray)
cv2.imwrite('Gray.png',gray)
##cv2.waitKey(0)
##cv2.destroyAllWindows()
###--Max pooling
Polling_Max = np.zeros((218,218))
Avg = np.zeros((218,218))
for x in range (218):
    for y in range (218):
        kernal = [gray[x][y],gray[x][y+1],gray[x+1][y], gray[x+1][y+1]]
        Polling_Max[x][y] = max(kernal)
for x in range (218):
    for y in range (218):
        sum = gray[x][y] + gray[x][y+1] + gray[x+1][y] + gray[x+1][y+1]
        avg = sum/4
        ##print(avg)
        Avg[x][y] = avg
cv2.imwrite('Gray_2.png',Polling_Max)
cv2.imwrite('Gray_avg.png',Avg)