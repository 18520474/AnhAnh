import copy
def port_declare():
    port_info = open("module/port_declare.txt", "r")
    return port_info.read()

def conv2d(input_depth = 2, output_depth = 5, stride = 2, padding = 1, input_x = 5, input_y = 5, weight_path = "layer_1/", layer_name = "layer_1", prev_layer_name = "layer_0"):
    conv2d = open("module/conv2d.txt", "r")
    my_conv2d = conv2d.read() 
    out = "module " + layer_name + "(                               \n"  
    out += "     input wire clk,                                             \n" 
    out += "     input wire rst,                                             \n" 
    out += "     input wire load,                                             \n" 
    out += "     input wire input_valid,                                             \n" 
    out += "     input wire sof,                                             \n"
    out += "     output wire o_sof,                                             \n"
    out += "     output wire load_success,                                             \n"
    out += "     output wire output_valid,                                      \n"
    out += "     output wire [31:0] d_out[" + str(output_depth - 1) + ":0],    \n" 
    #parameter
    if input_depth == 1:  
        out += "     input wire [31:0] d_in                                             \n"     
        out += "); \n"                           
        for i in range(output_depth):
            inst = my_conv2d
            inst = inst.replace("instance_name", layer_name + "_conv2d_" + str(i), 1)
            inst = inst.replace("weight_path", weight_path + str(i) + ".txt", 1)
            inst = inst.replace("is_relu", "1 /*use relu*/", 1)
            inst = inst.replace("stride", str(stride), 1)
            inst = inst.replace("padding", str(padding), 1)
            inst = inst.replace("input_x", str(input_x), 1)
            inst = inst.replace("input_y", str(input_y), 1)
            inst = inst.replace("_clk", "clk", 1)
            inst = inst.replace("_rst", "rst", 1)
            inst = inst.replace("_load", "load", 1)
            inst = inst.replace("_input_valid", "input_valid", 1)
            inst = inst.replace("_sof", "sof", 1) 
            inst = inst.replace("_d_in", "d_in", 1)
            inst = inst.replace("_d_out", "d_out[" + str(i) + "]", 1)
            if i == 0:
                inst = inst.replace("_load_success", "load_success", 1)
                inst = inst.replace("_o_sof_", "o_sof", 1)  
                inst = inst.replace("_output_valid_", "output_valid", 1) 
                out += inst
            else:
                inst = inst.replace("_load_success", "", 1)
                inst = inst.replace("_o_sof_","", 1)  
                inst = inst.replace("_output_valid_","", 1) 
                out += inst 
    else:
        out += "     input wire [31:0] d_in[" + str(input_depth - 1) + ":0]                    \n"
        out += "); \n"
        out += "wire output_valid_affter_conv;                                             \n"
        for i in range(output_depth):
            out  += "wire [31:0] " + "_" + str(i) +"_addbus_[" + str(input_depth - 1) + ":0];    \n"  
            for y in range(input_depth):
                inst = my_conv2d
                inst = inst.replace("instance_name", "conv2d_" + str(i) + "_" + str(y), 1)
                inst = inst.replace("weight_path", weight_path + str(i) + "_" + str(y) + ".txt", 1)
                inst = inst.replace("is_relu", "0 /*dont use relu*/", 1)
                inst = inst.replace("stride", str(stride), 1)
                inst = inst.replace("padding", str(padding), 1)
                inst = inst.replace("input_x", str(input_x), 1)
                inst = inst.replace("input_y", str(input_y), 1)
                inst = inst.replace("_clk", "clk", 1)
                inst = inst.replace("_rst", "rst", 1)
                inst = inst.replace("_input_valid", "input_valid", 1)
                inst = inst.replace("_load", "load", 1)
                inst = inst.replace("_sof", "sof", 1) 
                inst = inst.replace("_d_in", "d_in[" + str(y) + "]", 1)
                inst = inst.replace("_d_out","_" + str(i) + "_addbus_[" + str(y) + "]" , 1)
                inst = inst.replace("_o_sof_", "", 1)  
                if i == 0 and y == 0:
                    inst = inst.replace("_load_success", "load_success", 1)
                    inst = inst.replace("_output_valid_", "output_valid_affter_conv", 1) 
                    out += inst
                else:
                    inst = inst.replace("_load_success", "", 1)
                    inst = inst.replace("_output_valid_","", 1) 
                    out += inst 
            if(stride == 1 and padding == 0):
                output_size = input_x - 2
            elif(stride == 1 and padding == 1):
                output_size = input_x
            elif(stride == 2):
                output_size = (input_x - 1)/2
            out += "sum_" + str(input_depth) + " #(" + str(int(output_size)) + ")" +" sum_" + str(i) + "( \n"
            out += "        .clk(clk), \n"
            out += "        .rst(rst), \n"
            out += "        .input_valid(output_valid_affter_conv), \n"
            if i == 0:
                out += "        .output_valid(output_valid), \n"
                out += "        .o_sof(o_sof), \n"
            out += "        .data_out(" + "d_out[" + str(i) + "]), \n"
            for z in range(input_depth):
                if z == input_depth - 1:
                    out += "        .data_in_"+ str(z) + "(" + "_" + str(i) + "_addbus_[" + str(z) + "]) \n"
                else:    
                    out += "        .data_in_"+ str(z) + "(" + "_" + str(i) + "_addbus_[" + str(z) + "]), \n"
            out += "); \n"
    out += "endmodule"
    return out

def avg_poling(input_depth = 2, stride = 2, padding = 1, input_x = 5, input_y = 5, layer_name = "my_polling", prev_layer_name = "layer_0"):
    polling2d = open("module/avg_polling2d.txt", "r")
    polling = polling2d.read()
    out = "module " + layer_name + "(                               \n"  
    out += "     input wire clk,                                             \n" 
    out += "     input wire rst,                                             \n" 
    out += "     input wire input_valid,                                             \n" 
    out += "     input wire sof,                                             \n"
    out += "     output wire o_sof,                                             \n"
    out += "     output wire output_valid,                                      \n"
    out += "     output wire [31:0] d_out[" + str(input_depth - 1) + ":0],    \n" 
    out += "     input  wire [31:0] d_in["  + str(input_depth - 1) + ":0]    \n" 
    out += "); \n"
    #parameter                                
    for i in range(input_depth):
        inst = polling
        inst = inst.replace("instance_name", "polling_" + str(i), 1)
        inst = inst.replace("stride", str(stride), 1)
        inst = inst.replace("padding", str(padding), 1)
        inst = inst.replace("input_x", str(input_x), 1)
        inst = inst.replace("input_y", str(input_y), 1)
        inst = inst.replace("_clk", "clk", 1)
        inst = inst.replace("_rst", "rst", 1)
        inst = inst.replace("_input_valid", "input_valid", 1)
        inst = inst.replace("_sof", "sof", 1) 
        inst = inst.replace("_d_in", "d_in[" + str(i) + "]", 1)
        inst = inst.replace("_d_out", "d_out[" + str(i) + "]", 1)
        if i == 0:
            inst = inst.replace("_o_sof_", "o_sof", 1)  
            inst = inst.replace("_output_valid_", "output_valid", 1) 
            out += inst
        else:
            inst = inst.replace("_o_sof_","", 1)  
            inst = inst.replace("_output_valid_","", 1) 
            out += inst 
        out += "\n"
    out += "endmodule"
    return out
def max_poling(input_depth = 2, stride = 2, padding = 1, input_x = 5, input_y = 5, layer_name = "my_polling", prev_layer_name = "layer_0"):
    polling2d = open("module/max_polling2d.txt", "r")
    polling = polling2d.read()
    out = "module " + layer_name + "(                               \n"  
    out += "     input wire clk,                                             \n" 
    out += "     input wire rst,                                             \n" 
    out += "     input wire input_valid,                                             \n" 
    out += "     input wire sof,                                             \n"
    out += "     output wire o_sof,                                             \n"
    out += "     output wire output_valid,                                      \n"
    out += "     output wire [31:0] d_out[" + str(input_depth - 1) + ":0],    \n" 
    out += "     input  wire [31:0] d_in["  + str(input_depth - 1) + ":0]    \n" 
    out += "); \n"
    #parameter                                
    for i in range(input_depth):
        inst = polling
        inst = inst.replace("instance_name", "polling_" + str(i), 1)
        inst = inst.replace("stride", str(stride), 1)
        inst = inst.replace("padding", str(padding), 1)
        inst = inst.replace("input_x", str(input_x), 1)
        inst = inst.replace("input_y", str(input_y), 1)
        inst = inst.replace("_clk", "clk", 1)
        inst = inst.replace("_rst", "rst", 1)
        inst = inst.replace("_input_valid", "input_valid", 1)
        inst = inst.replace("_sof", "sof", 1) 
        inst = inst.replace("_d_in", "d_in[" + str(i) + "]", 1)
        inst = inst.replace("_d_out", "d_out[" + str(i) + "]", 1)
        if i == 0:
            inst = inst.replace("_o_sof_", "o_sof", 1)  
            inst = inst.replace("_output_valid_", "output_valid", 1) 
            out += inst
        else:
            inst = inst.replace("_o_sof_","", 1)  
            inst = inst.replace("_output_valid_","", 1) 
            out += inst 
        out += "\n"
    out += "endmodule"
    return out