from function import *
layer_name   =  ["conv2d_0", "max_polling", "conv2d_1", "conv2d_2", "conv2d_3","conv2d_4","conv2d_5","conv2d_6", "avg_polling"]
stride       =  [2,           2,             2,          1,          1,         2,         1,          1,         1]
padding      =  [0,           0,             0,          1,          1,         0,         1,          1,         0]
input_x      =  [64,          31,            15,         7,          7,         7,         3,          3,         3]
input_y      =  [64,          31,            15,         7,          7,         7,         3,          3,         3]
input_depth  =  [1,           4,             4,          8,          8,         8,        16,         16,        16]
output_depth =  [4,           4,             8,          8,          8,         16,       16,         16,        16] 

for i in range(len(layer_name)):
    f = open("generated_rtl_code/" + layer_name[i] + ".sv", "w")
    if layer_name[i] == "max_polling":
        code = max_poling(input_depth=input_depth[i], layer_name=layer_name[i], stride= stride[i], padding=padding[i], input_x=input_x[i], input_y=input_y[i])
    elif layer_name[i] == "avg_polling":
        code = avg_poling(input_depth=input_depth[i], layer_name=layer_name[i], stride= stride[i], padding=padding[i], input_x=input_x[i], input_y=input_y[i])
    else:
        code = conv2d(input_depth=input_depth[i], output_depth= output_depth[i], layer_name=layer_name[i], weight_path= "weight/" + layer_name[i] + "/", padding = padding[i], stride = stride[i], input_x= input_x[i], input_y= input_y[i])
    f.write(code)
    code = ""
    f.close
print("done !")
