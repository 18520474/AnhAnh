from cv2 import cv2
img = cv2.imread('Result2.png')
#gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#print(img)
convert = open("Bin2.txt", "w")
for i in range(len(img)):
    for j in range(len(img[0])):
        #print(str(i) + " " + str(j))
        convert.write(str(img[i][j])+ "\n")