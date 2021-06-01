import copy
def port_declare():
    port_info = open("module/port_declare.txt", "r")
    return port_info.read()

def conv2d(input_depth = 2, output_depth = 5, stride = 2, padding = 1, input_x = 5, input_y = 5, weight_path = "layer_1/", layer_name = "layer_1", prev_layer_name = "layer_0"):
    conv2d = open("module/conv2d.txt", "r")
    my_conv2d = conv2d.read() 
    out  = "wire [31:0] " + layer_name + "_output[" + str(output_depth - 1) + ":0];    \n"  
    out += "wire " + layer_name + "_o_sof;                                             \n"
    out += "wire " + layer_name + "_output_valid;                                      \n"
    #parameter
    if input_depth == 1:                                  
        for i in range(output_depth):
            inst = my_conv2d
            inst = inst.replace("instance_name", layer_name + "_conv2d_" + str(i), 1)
            inst = inst.replace("weight_path", weight_path + "_" + str(i) + ".txt", 1)
            inst = inst.replace("stride", str(stride), 1)
            inst = inst.replace("padding", str(padding), 1)
            inst = inst.replace("input_x", str(input_x), 1)
            inst = inst.replace("input_y", str(input_y), 1)
            inst = inst.replace("_clk", "clk", 1)
            inst = inst.replace("_rst", "rst", 1)
            inst = inst.replace("_input_valid", prev_layer_name + "_output_valid", 1)
            inst = inst.replace("_sof", prev_layer_name + "_o_sof", 1) 
            inst = inst.replace("_d_in", "d_in", 1)
            inst = inst.replace("_d_out", layer_name + "_output[" + str(i) + "]", 1)
            if i == 0:
                inst = inst.replace("_o_sof_", layer_name + "_o_sof", 1)  
                inst = inst.replace("_output_valid_", layer_name + "_output_valid", 1) 
                out += inst
            else:
                inst = inst.replace("_o_sof_","", 1)  
                inst = inst.replace("_output_valid_","", 1) 
                out += inst 
    else:
        out += "wire " + layer_name + "_output_valid_affter_conv;                                             \n"
        for i in range(output_depth):
            out  += "wire [31:0] " + layer_name + "_" + str(i) +"_addbus_[" + str(input_depth - 1) + ":0];    \n"  
            for y in range(input_depth):
                inst = my_conv2d
                inst = inst.replace("instance_name", layer_name + "_conv2d_" + str(i) + "_" + str(y), 1)
                inst = inst.replace("weight_path", weight_path + "_" + str(i) + "_" + str(y) + ".txt", 1)
                inst = inst.replace("stride", str(stride), 1)
                inst = inst.replace("padding", str(padding), 1)
                inst = inst.replace("input_x", str(input_x), 1)
                inst = inst.replace("input_y", str(input_y), 1)
                inst = inst.replace("_clk", "clk", 1)
                inst = inst.replace("_rst", "rst", 1)
                inst = inst.replace("_input_valid", prev_layer_name + "_output_valid", 1)
                inst = inst.replace("_sof", prev_layer_name + "_o_sof", 1) 
                inst = inst.replace("_d_in", "d_in", 1)
                inst = inst.replace("_d_out", layer_name + "_" +str(i) + "_addbus_[" + str(y) + "]" , 1)
                if i == 0 and y == 0:
                    inst = inst.replace("_o_sof_", layer_name + "_o_sof", 1)  
                    inst = inst.replace("_output_valid_", layer_name + "_output_valid_affter_conv", 1) 
                    out += inst
                else:
                    inst = inst.replace("_o_sof_","", 1)  
                    inst = inst.replace("_output_valid_","", 1) 
                    out += inst 
            out += "sum_" + str(input_depth) + " " + layer_name + "_sum_" + str(i) + "( \n"
            out += "        .clk(clk), \n"
            out += "        .clk(rst), \n"
            out += "        .input_valid(" + layer_name + "_output_valid_affter_conv), \n"
            if i == 0:
                out += "        .output_valid(" + layer_name + "_output_valid), \n"
            else:
                out += "        .output_valid(), \n"
            out += "        .d_out(" + layer_name + "_output[" + str(i) + "]), \n"
            for z in range(input_depth):
                out += "        .d_in(" + layer_name + "_" + str(i) + "_addbus_[" + str(z) + "]), \n"
            out += "); \n"
    return out

def poling(input_depth = 2, stride = 2, padding = 1, input_x = 5, input_y = 5, layer_name = "my_polling", prev_layer_name = "layer_0"):
    polling2d = open("module/polling2d.txt", "r")
    polling = polling2d.read()
    out  = "wire [31:0] " + layer_name + "_output[" + str(input_depth - 1) + ":0];    \n"  
    out += "wire " + layer_name + "_o_sof;                                            \n"
    out += "wire " + layer_name + "_output_valid;                                     \n"
    #parameter                                
    for i in range(input_depth):
        inst = polling
        inst = inst.replace("instance_name", layer_name + "_polling_" + str(i), 1)
        inst = inst.replace("stride", str(stride), 1)
        inst = inst.replace("padding", str(padding), 1)
        inst = inst.replace("input_x", str(input_x), 1)
        inst = inst.replace("input_y", str(input_y), 1)
        inst = inst.replace("_clk", "clk", 1)
        inst = inst.replace("_rst", "rst", 1)
        inst = inst.replace("_input_valid", prev_layer_name + "_output_valid", 1)
        inst = inst.replace("_sof", prev_layer_name + "_o_sof", 1) 
        inst = inst.replace("_d_in", prev_layer_name + "_output[" + str(i) + "]", 1)
        inst = inst.replace("_d_out", layer_name + "_output[" + str(i) + "]", 1)
        if i == 0:
            inst = inst.replace("_o_sof_", layer_name + "_o_sof", 1)  
            inst = inst.replace("_output_valid_", layer_name + "_output_valid", 1) 
            out += inst
        else:
            inst = inst.replace("_o_sof_","", 1)  
            inst = inst.replace("_output_valid_","", 1) 
            out += inst 
    return out
