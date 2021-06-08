from string import Template
number=int(16)
number2= int(8)
f = open('add_' + str(number) +'bit.v', 'w')
module_begin='''module $name
(
	input clk,
	input rst,
    input input_valid,
    output reg output_valid,
	output wire [31:0] data_out,'''
input_begin ='''
    input [31:0] data_in_$number,'''

input_end ='''
    input [31:0] data_in_$number
    );'''

check ='''

always @ (posedge clk or posedge rst) begin
	if(rst) begin'''

check_end ='''
    end
end'''
#### generate input ####
temp_input_begin=Template(module_begin)
f.write(temp_input_begin.substitute(name = 'add_' + str(number) + 'bit'))
for i in range(number) :
    if (i == number-1) :
        temp_input_begin=Template(input_end)
        f.write(temp_input_begin.substitute(number = i))
    else :
        temp_input_begin=Template(input_begin)
        f.write(temp_input_begin.substitute(number = i))
##### Set template #######

param_1 = int(2)

stage_1=''' 
reg[31:0] $reg;
wire[31:0] $wire;
wire output_valid_and [1:0];
reg stage_1_output_valid [1:0];'''

module_add_8bit_begin ='''
add_$numbit $name
(
.clk(clk),
.rst(rst),
.input_valid(input_valid),
'''
module_add_8bit_din = '''.data_in_$num($data_in),
'''
module_add_8bit_end = '''.output_valid($num),
.data_out($data_out)
);'''
stage_1_check = '''
        $name <= 32'd0;'''
stage_1_reg_out = '''
        $name1 <= $name2;'''


############# STAGE 1 ########
f.write('\n////////////// STAGE_1 ///////////////')
temp_stage_1=Template(stage_1)
f.write(temp_stage_1.substitute(reg = 'stage_1_reg [' + str(param_1-1) +':0]', wire = 'stage_1_add [' + str(param_1-1) +':0]'))
temp_stage_1=Template(module_add_8bit_begin)
f.write(temp_stage_1.substitute(numbit = str(number2) + 'bit', name = 'add_' + str(number2) + 'bit_1'))
for i in range (number2) :
    temp_stage_1=Template(module_add_8bit_din)
    f.write(temp_stage_1.substitute( num = i, data_in = 'data_in_' + str(i)))
temp_stage_1=Template(module_add_8bit_end)
f.write(temp_stage_1.substitute(data_out = 'stage_1_add[0]', num = 'output_valid_and [0]'))

temp_stage_1=Template(module_add_8bit_begin)
f.write(temp_stage_1.substitute(numbit = str(number2) + 'bit', name = 'add_' + str(number2) + 'bit_2'))
for i in range (number2) :
    temp_stage_1=Template(module_add_8bit_din)
    f.write(temp_stage_1.substitute( num = i, data_in = 'data_in_' + str(i+number2)))
temp_stage_1=Template(module_add_8bit_end)
f.write(temp_stage_1.substitute(data_out = 'stage_1_add[1]',  num = 'output_valid_and [1]'))

f.write(check)
for i in range(param_1) :
    temp_stage_1=Template(stage_1_check)
    f.write(temp_stage_1.substitute(name = 'stage_1_reg[' + str(i) +']'))
f.write('\n        stage_1_output_valid[0] <= 0;')
f.write('\n        stage_1_output_valid[1] <= 0;')
f.write('\n    end else begin')
for i in range(param_1) :
    temp_stage_1=Template(stage_1_reg_out)
    f.write(temp_stage_1.substitute(name1 = 'stage_1_reg[' + str(i) +']', name2 = 'stage_1_add[' + str(i) +']'))
f.write('\n        stage_1_output_valid[0] <= output_valid_and[0];')
f.write('\n        stage_1_output_valid[1] <= output_valid_and[1];')
f.write(check_end)

########### Set Template ######
param_2 = int(1)

stage_2=''' 
reg[31:0] stage_2_reg;
wire[31:0] stage_2_add;
wire output_valid_wire;
'''

stage_2_module = '''
fp_adder $name(.a_operand($a_operand), .b_operand($b_operand), .AddBar_Sub(1'b0) , .result($result));'''

stage_2_check = '''
        $name <= 32'd0;'''
stage_2_reg_out = '''
        $name1 <= $name2;'''

#############STAGE 2#########
f.write('\n////////////// STAGE_2 ///////////////')
f.write(stage_2)
for i in range(param_2) :
    temp_stage_2=Template(stage_2_module)
    f.write(temp_stage_2.substitute(name = 'stage_2_add_' +str(i), a_operand = 'stage_1_reg[' + str(i*2) +']', b_operand = 'stage_1_reg[' + str(i*2+1) +']', result = 'stage_2_add' ))
f.write('\nand(output_valid_wire,stage_1_output_valid[0],stage_1_output_valid[1]);')
f.write(check)
for i in range(param_2) :
    temp_stage_2=Template(stage_2_check)
    f.write(temp_stage_2.substitute(name = 'stage_2_reg'))
f.write('\n        output_valid <= 0;')
f.write('\n    end else begin')
for i in range(param_2) :
    temp_stage_2=Template(stage_2_reg_out)
    f.write(temp_stage_2.substitute(name1 = 'stage_2_reg', name2 = 'stage_2_add'))
f.write('\n        output_valid <= output_valid_wire;')
f.write(check_end)
f.write('\nassign data_out = stage_2_reg;')
f.write('\nendmodule')