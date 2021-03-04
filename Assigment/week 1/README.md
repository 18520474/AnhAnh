## Tạo Github Repo
[Github Repo](https://docs.github.com/en/github/getting-started-with-github/create-a-repo)
## Cài đặt Ubuntu trên máy ảo
[Ubuntu desktop](https://ubuntu.com/download/desktop)
## Cài OpenCV trên python
[Open CV](https://docs.opencv.org/master/d2/de6/tutorial_py_setup_in_ubuntu.html)
## Bài tập
##### Read, Write and Display a video/webcam using OpenCV python
###### Read & Display
```python
import numpy as np
from cv2 import cv2 as cv

#please change your path to video you have downloaded here
cap = cv.VideoCapture('/home/cheems/Videos/bonk360p.mp4')

while cap.isOpened():
    ret, frame = cap.read()
    #if frame is read correctly ret is True
    if not ret:
        print("Can't receive frame (stream end?). Exiting ...")
        break
    
    #convert all colors of frame to gray
    #gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    #cv.imshow('frame', gray)

    #show original frame
    cv.imshow('bonk 360p',frame)

    #press q to close frame
    if cv.waitKey(1) == ord('q'):
        break
    
cap.release()
cv.destroyAllWindows()
```


