from function import *
f = open("top.v", "w")
a = conv_code_gen(
    prev_layer_name = "layer_0", 
    layer_name = "layer_1", 
    padding = 0, 
    stride = 1, 
    input_x = 4, 
    input_depth = 256, 
    output_depth = 256, 
    conv_ins_name = "conv", 
    sum_ins_name = "sum",
    weight_path = "C:/weight/"
    )
f.write(a)
f.close
print("done")