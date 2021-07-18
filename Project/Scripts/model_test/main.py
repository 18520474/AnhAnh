import tensorflow as tf
import numpy as np
import struct
from tensorflow.keras import layers, models
from keras.models import Model
from tensorflow import keras
from cv2 import cv2
from numpy import asarray

img_link = "test_img/0.png"

model = keras.models.load_model("my_model")
img = cv2.imread(img_link)
img = cv2.resize (img, (64,64))
img = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
img = np.array(img).reshape((1,64,64,1))
model.predict(img)