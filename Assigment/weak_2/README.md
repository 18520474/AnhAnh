# HW
## Convert RGB to Grayscale
### Python code
``` python
from cv2 import cv2
  
image = cv2.imread('pika.png')
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
cv2.imwrite('Result.png',gray)
cv2.imshow('Original image',image)
cv2.imshow('Gray image', gray)
  
cv2.waitKey(0)
cv2.destroyAllWindows()
```
