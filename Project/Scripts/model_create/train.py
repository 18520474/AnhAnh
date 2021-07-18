import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import numpy as np
from keras import layers
from keras.layers import LayerNormalization, Dropout, Input, Add, Dense, Activation, ZeroPadding2D, BatchNormalization, Flatten, Conv2D, AveragePooling2D, MaxPooling2D, GlobalMaxPooling2D
from keras.models import Model, load_model
from keras.preprocessing import image
from keras.utils import layer_utils
from keras.utils.data_utils import get_file
from keras.applications.imagenet_utils import preprocess_input
from IPython.display import SVG
from keras.utils.vis_utils import model_to_dot
##from keras.utils import plot_model
from keras.initializers import glorot_uniform
import scipy.misc
import matplotlib.pyplot as plt
from matplotlib.pyplot import imshow
from tensorflow.keras import activations, models
from sklearn.model_selection import train_test_split

import keras.backend as K
K.set_image_data_format('channels_last')
K.set_learning_phase(1)

X_orig = np.load("dataset/X.npy")
Y_orig = np.load("datasetY.npy")
X_orig = X_orig.reshape(-1,64,64,1)
label_y = []
label_y = [np.where(i==1)[0][0] for i in Y_orig]
count = pd.Series(label_y).value_counts()
X_organized = np.concatenate((X_orig[204:409,:],
                              X_orig[822:1028,:],
                              X_orig[1649:1855,:],
                              X_orig[1443:1649,:],
                              X_orig[1236:1443,:],
                              X_orig[1855:2062,:],
                              X_orig[615:822,:],
                              X_orig[409:615,:],
                              X_orig[1028:1236,:],
                              X_orig[0:204,:]),axis = 0)
train_x,test_x,train_y,test_y = train_test_split(X_organized,Y_orig,test_size=0.2)
model = keras.models.load_model("my_model")
model.fit(train_x, train_y, epochs = 50, batch_size = 32)
evals = model.evaluate(test_x,test_y)
print("loss" +str(evals[0]))
print("accuracy" +str(evals[1]))
model.save("my_model")