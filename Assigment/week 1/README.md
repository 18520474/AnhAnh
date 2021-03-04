# Tạo Github Repo
[Github Repo](https://docs.github.com/en/github/getting-started-with-github/create-a-repo)
# Cài đặt Ubuntu trên máy ảo
[Ubuntu desktop](https://ubuntu.com/download/desktop)
# Cài OpenCV trên python
[Open CV](https://docs.opencv.org/master/d2/de6/tutorial_py_setup_in_ubuntu.html)
# Bài tập
## Read, Write and Display a video/webcam using OpenCV python
### Read & Display
```python
import cv2
import numpy as np

# Create a VideoCapture object and read from input file
# If the input is the camera, pass 0 instead of the video file name
cap = cv2.VideoCapture('/home/tuananh/Videos/OP.mp4')

# Check if camera opened successfully
if (cap.isOpened()== False): 
  print("Error opening video stream or file")

# Read until video is completed
while(cap.isOpened()):
  # Capture frame-by-frame
  ret, frame = cap.read()
  if ret == True:

    # Display the resulting frame
    cv2.imshow('Frame',frame)

    # Press Q on keyboard to  exit
    if cv2.waitKey(25) & 0xFF == ord('q'):
      break

  # Break the loop
  else: 
    break

cap.release()
cv2.destroyAllWindows()
```
### Write & Display
```python
import numpy as np
from cv2 import cv2 as cv

#please change your path to video you have downloaded here
cap = cv.VideoCapture('/home/tuananh/Videos/OP.mp4')

#settings for output video
frame_width = int(cap.get(3))
frame_height = int(cap.get(4))
fourcc = cv.VideoWriter_fourcc(*'MP4V')
fps = 23

#please change your path for your output video here
out = cv.VideoWriter('/home/tuananh/Videos/OP.mp4',fourcc, fps, (frame_width,frame_height))

while(True):
  ret, frame = cap.read()

  if ret == True: 
    out.write(frame)
    cv.imshow('output',frame)

    #press q to stop writing video
    if cv.waitKey(1) & 0xFF == ord('q'):
      break
  else:
    break  

cap.release()
out.release()
cv.destroyAllWindows()
```


