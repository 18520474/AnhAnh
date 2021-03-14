from cv2 import cv2
import fire
def printimg(img):
    image = cv2.imread(img)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    #cv2.imwrite('Result.png',gray)
    cv2.imshow('Original image',image)
    cv2.imshow('Gray image', gray)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    return image, gray

if __name__ == '__main__':
    fire.Fire(printimg)
