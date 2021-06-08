from string import Template
j=int(8)
f = open('add_' + str(j) +'bit.v', 'w')
module_begin='''module add_8bit
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
f.write(module_begin)
for i in range(j) :
    if (i == j-1) :
        temp_input_begin=Template(input_end)
        f.write(temp_input_begin.substitute(number = i))
    else :
        temp_input_begin=Template(input_begin)
        f.write(temp_input_begin.substitute(number = i))

###### Set template #######
param_1 = int(4)

stage_1=''' 
reg[31:0] $reg;
wire[31:0] $wire;
reg stage_1_output_valid;'''

stage_1_module = '''
fp_adder $name(.a_operand($a_operand), .b_operand($b_operand), .AddBar_Sub(1'b0) , .result($result));'''

stage_1_check = '''
        $name <= 32'd0;'''
stage_1_reg_out = '''
        $name1 <= $name2;'''

###### generate stage 1 ##############

f.write('\n////////////// STAGE_1 ///////////////')
temp_stage_1=Template(stage_1)
f.write(temp_stage_1.substitute(reg = 'stage_1_reg [' + str(param_1-1) +':0]', wire = 'stage_1_add [' + str(param_1-1) +':0]'))
for i in range(param_1) :
    temp_stage_1=Template(stage_1_module)
    f.write(temp_stage_1.substitute(name = 'stage_1_add_' +str(i), a_operand = 'data_in_' + str(i*2), b_operand = 'data_in_' +  str(i*2+1), result = 'stage_1_add[' + str(i) + ']' ))
f.write(check)
for i in range(param_1) :
    temp_stage_1=Template(stage_1_check)
    f.write(temp_stage_1.substitute(name = 'stage_1_reg[' + str(i) +']'))
f.write('\n        stage_1_output_valid <= 0;')
f.write('\n    end else begin')
for i in range(param_1) :
    temp_stage_1=Template(stage_1_reg_out)
    f.write(temp_stage_1.substitute(name1 = 'stage_1_reg[' + str(i) +']', name2 = 'stage_1_add[' + str(i) +']'))
f.write('\n        stage_1_output_valid <= input_valid;')
f.write(check_end)

###### Set template stage 2 #######

param_2 = int(2)

stage_2=''' 
reg[31:0] $reg;
wire[31:0] $wire;
reg stage_2_output_valid;'''

stage_2_module = '''
fp_adder $name(.a_operand($a_operand), .b_operand($b_operand), .AddBar_Sub(1'b0) , .result($result));'''

stage_2_check = '''
        $name <= 32'd0;'''
stage_2_reg_out = '''
        $name1 <= $name2;'''

###### generate stage 2 ##############

f.write('\n////////////// STAGE_2 ///////////////')
temp_stage_2=Template(stage_2)
f.write(temp_stage_2.substitute(reg = 'stage_2_reg [' + str(param_2-1) +':0]', wire = 'stage_2_add [' + str(param_2-1) +':0]'))
for i in range(param_2) :
    temp_stage_2=Template(stage_2_module)
    f.write(temp_stage_2.substitute(name = 'stage_2_add_' +str(i), a_operand = 'stage_1_reg[' + str(i*2) +']', b_operand = 'stage_1_reg[' + str(i*2+1) +']', result = 'stage_2_add[' + str(i) + ']' ))
f.write(check)
for i in range(param_2) :
    temp_stage_2=Template(stage_2_check)
    f.write(temp_stage_2.substitute(name = 'stage_2_reg[' + str(i) +']'))
f.write('\n        stage_2_output_valid <= 0;')
f.write('\n    end else begin')
for i in range(param_2) :
    temp_stage_2=Template(stage_2_reg_out)
    f.write(temp_stage_2.substitute(name1 = 'stage_2_reg[' + str(i) +']', name2 = 'stage_2_add[' + str(i) +']'))
f.write('\n        stage_2_output_valid <= stage_1_output_valid;')
f.write(check_end)

###### Set template stage 3 #######

param_3 = int(1)

stage_3=''' 
reg[31:0] $reg;
wire[31:0] $wire;'''

stage_3_module = '''
fp_adder $name(.a_operand($a_operand), .b_operand($b_operand), .AddBar_Sub(1'b0) , .result($result));'''

stage_3_check = '''
        $name <= 32'd0;'''
stage_3_reg_out = '''
        $name1 <= $name2;'''

###### generate stage 3 ##############

f.write('\n////////////// STAGE_3 ///////////////')
temp_stage_3=Template(stage_3)
f.write(temp_stage_3.substitute(reg = 'stage_3_reg', wire = 'stage_3_add'))
for i in range(param_3) :
    temp_stage_3=Template(stage_3_module)
    f.write(temp_stage_3.substitute(name = 'stage_3_add_' +str(i), a_operand = 'stage_2_reg[' + str(i*2) +']', b_operand = 'stage_2_reg[' + str(i*2+1) +']', result = 'stage_3_add' ))
f.write(check)
for i in range(param_3) :
    temp_stage_3=Template(stage_3_check)
    f.write(temp_stage_3.substitute(name = 'stage_3_reg'))
f.write('\n        output_valid <= 0;')
f.write('\n    end else begin')
for i in range(param_3) :
    temp_stage_3=Template(stage_3_reg_out)
    f.write(temp_stage_3.substitute(name1 = 'stage_3_reg', name2 = 'stage_3_add'))
f.write('\n        output_valid <= stage_2_output_valid;')
f.write(check_end)
f.write('\nassign data_out = stage_3_reg;')
f.write('\nendmodule')
