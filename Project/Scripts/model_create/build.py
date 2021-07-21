#create model code
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
from tensorflow.keras import activations

import keras.backend as K
K.set_image_data_format('channels_last')
K.set_learning_phase(1)

def ResNet(input_shape = (64, 64, 1), classes = 10):
    # Define the input with shape input_shape
    X_input = Input(input_shape)
    X = Conv2D(activation = 'relu', name = 'conv2d_0', filters= 4, kernel_size=(3,3), strides=(2,2),padding='valid', use_bias = False, kernel_initializer='he_normal')(X_input)
    X = MaxPooling2D(name = 'max', pool_size = (3, 3), strides=(2, 2))(X)
    X = Conv2D(activation = 'relu', name = 'conv2d_1', filters= 8, kernel_size=(3,3), strides=(2,2),padding='valid', use_bias = False, kernel_initializer='he_normal')(X)
    short_cut_0 = X
    X = Conv2D(activation = 'relu', name = 'conv2d_2', filters= 8, kernel_size=(3,3), strides=(1,1),padding='same', use_bias = False, kernel_initializer='he_normal')(X)
    X = Conv2D(activation = 'relu', name = 'conv2d_3', filters= 8, kernel_size=(3,3), strides=(1,1),padding='same', use_bias = False, kernel_initializer='he_normal')(X)
    X = Add()([X, short_cut_0])
    X = Conv2D(activation = 'relu', name = 'conv2d_4', filters= 16, kernel_size=(3,3), strides=(2,2),padding='valid', use_bias = False, kernel_initializer='he_normal')(X)     
    short_cut_1 = X
    X = Conv2D(activation = 'relu', name = 'conv2d_5', filters= 16, kernel_size=(3,3), strides=(1,1),padding='same', use_bias = False, kernel_initializer='he_normal')(X)
    X = Conv2D(activation = 'relu', name = 'conv2d_6', filters= 16, kernel_size=(3,3), strides=(1,1),padding='same', use_bias = False, kernel_initializer='he_normal')(X)
    X = Add()([X, short_cut_1])
    X = AveragePooling2D(name = 'avg', pool_size = (3, 3), strides=(1, 1))(X)
    # output layer
    X = Flatten()(X)
    X = Dense(classes,kernel_initializer = glorot_uniform(seed=0), use_bias = False)(X)
    X = Activation('softmax')(X)
    # Create model
    model = Model(inputs = X_input, outputs = X, name='ResNet50')
    return model
model = ResNet(input_shape=(64,64,1),classes=10)
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])
model.save("my_model")
