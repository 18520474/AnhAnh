def conv_code_gen(prev_layer_name, layer_name, padding, stride, input_depth, output_depth, input_x, conv_ins_name, sum_ins_name, weight_path):
    out =  "wire [31:0] " + layer_name + "_output[" + str(output_depth - 1) + ":0]; \n"
    out += "wire        " + layer_name + "_o_sof;         \n"
    out += "wire        " + layer_name + "_output_valid;  \n"
    if(input_depth != 1):
        for i in range(output_depth):
            out += "wire [31:0] " + layer_name + "_add_bus_" + str(i) + "[" + str(input_depth - 1) + ":0];   \n" 
            for y in range(input_depth):
                layer_weight_path = '"' + weight_path + "_" + str(i) + "_" +  str(y) + ".txt" + '"'
                out += conv_ins_name + " #(" + layer_weight_path + ", " + str(stride) + ", " + str(padding) + ", "+ str(input_x) + ", " + str(input_x) + ") " + layer_name + '_' + str(i) + "_" + str(y) + '(' + "\n"
                out += "    .clk(clk),                                                               \n"
                out += "    .rst(rst),                                                               \n"
                out += "    .load(load),                                                             \n"
                out += "    .input_valid(" + prev_layer_name + "_output_valid),                      \n"
                out += "    .sof("         + prev_layer_name + "_o_sof),                             \n"
                out += "    .d_in("        + prev_layer_name + "_output["  + str(y) + "]),           \n"
                out += "    .d_out("       + layer_name + "_add_bus_" + str(i) + "[" + str(y) + "]), \n"
                if(i == 0 and y == 0):
                    out += "    .output_valid(" + layer_name + "_output_valid),                      \n"
                    out += "    .o_sof("        + layer_name + "_o_sof),                             \n"
                out += ");                                                                           \n"
            out += sum_ins_name + " " + layer_name + "_sum_"        + str(i) + "(                    \n"
            out += "    .out("        + layer_name + "_output["     + str(i) + "]),                  \n" 
            for z in range(input_depth):
                out += "    .in_" + str(z) + "(" + layer_name + "_add_bus_" + str(i) + "[" + str(z) + "]), \n" 
            out += "); \n"
    else:
        for i in range(output_depth): 
            layer_weight_path = layer_name + str(i) + ".txt"
            out += conv_ins_name + " #(" + layer_weight_path + ", " + str(stride) + ", " + str(padding) + ", "+ str(input_x) + ", " + str(input_x) + ") " + layer_name + "_" + str(i) + '(' + "\n"
            out += "    .clk(clk),                                            \n"
            out += "    .rst(rst),                                            \n"
            out += "    .load(load),                                          \n"
            out += "    .sof(sof),                                            \n"
            out += "    .load_success(load_success),                          \n"
            out += "    .d_in(d_in),                                          \n"
            out += "    .input_valid(input_valid),                            \n"
            out += "    .d_out(" + layer_name + "_output[" + str(i) + "]),    \n"
            if(i==0):
                out += "    .output_valid(" + layer_name + "_output_valid),   \n"
                out += "    .o_sof("        + layer_name + "_o_sof),          \n"
            out += ");                                                        \n"
    return out

def polling_code_gen(prev_layer_name, layer_name, padding, stride, input_depth, output_depth, input_x, polling_ins_name):
    ins_name =  "wire [31:0] " + layer_name + "_output[" + str(output_depth - 1) + ":0]; \n"
    ins_name += "wire       "  + layer_name + "_o_sof;                                   \n"
    ins_name += "wire       "  + layer_name + "_output_valid;                            \n"
    for i in range(output_depth):
        ins_name += polling_ins_name + " #(" + str(stride) + ", " + str(padding) + ", "+ str(input_x) + ", " + str(input_x) + ") " + layer_name +'_' + str(i) + '(' + "\n"
        ins_name += "    .clk(clk),                                                      \n"
        ins_name += "    .rst(rst),                                                      \n"
        ins_name += "    .load(load),                                                    \n"
        ins_name += "    .input_valid(" + prev_layer_name + "_output_valid),             \n"
        ins_name += "    .sof("         + prev_layer_name + "_o_sof),                    \n"
        ins_name += "    .d_in("        + prev_layer_name + "_output[" + str(i) + "]),   \n"
        ins_name += "    .d_out("       + layer_name + "_output[" + str(i) + "]),        \n" 
        if(i==0):
            ins_name += "    .output_valid(" + layer_name + "_output_valid),             \n"
            ins_name += "    .o_sof("        + layer_name + "_o_sof),                    \n"
        ins_name += ");                                                                  \n"
    return ins_name