import numpy as np
import tensorflow as tf
from tensorflow import keras
import numpy as np
import struct

model = keras.models.load_model("my_model")

for layer in model.layers:
    weights = layer.get_weights()
    if(weights != []):
        if(str(layer.name).find("conv2d") != -1):
            _, _, _, input_depth, output_depth = np.array(weights).shape
            for _output_depth in range(output_depth):
                for _input_depth in range(input_depth):
                    if(input_depth == 1):
                        file_name = 'weight/' + layer.name + '/' + str(_output_depth) + ".txt" 
                    else:
                        file_name = 'weight/' + layer.name + '/' + str(_output_depth) + "_" + str(_input_depth) + ".txt" 
                    f = open(file_name, "w")
                    for kernal_x in range(3):
                        for kernal_y in range(3):
                            _bin = format(struct.unpack('!I', struct.pack('!f', weights[0][kernal_x][kernal_y][_input_depth][_output_depth]))[0], '032b')
                            f.write(_bin + "\n")
                    f.close()
                print("layer: " + layer.name + " status: writing - " + str(int((_output_depth/output_depth)*100)) + " %")
        elif (layer.name == "dense"): #dense
            print(np.array(weights).shape)
            _, input_depth, output_depth = np.array(weights).shape
            for _output_depth in range(output_depth):
                file_name = 'weight/' + layer.name + '/' + str(_output_depth) + ".txt" 
                f = open(file_name, "w")
                for _input_depth in range(input_depth):
                    _bin = format(struct.unpack('!I', struct.pack('!f', weights[0][_input_depth][_output_depth]))[0], '032b')
                    f.write(_bin + "\n")    
                f.close()
                print("layer: " + layer.name + " status: writing - " + str(int((_output_depth/output_depth)*100)) + " %")
print("done")

