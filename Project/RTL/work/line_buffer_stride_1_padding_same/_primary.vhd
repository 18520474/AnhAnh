library verilog;
use verilog.vl_types.all;
entity line_buffer_stride_1_padding_same is
    generic(
        data_width      : integer := 32;
        input_y         : integer := 5;
        input_x         : integer := 5
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sof             : in     vl_logic;
        busy            : out    vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        data_in         : in     vl_logic_vector;
        data_out_0      : out    vl_logic_vector;
        data_out_1      : out    vl_logic_vector;
        data_out_2      : out    vl_logic_vector;
        data_out_3      : out    vl_logic_vector;
        data_out_4      : out    vl_logic_vector;
        data_out_5      : out    vl_logic_vector;
        data_out_6      : out    vl_logic_vector;
        data_out_7      : out    vl_logic_vector;
        data_out_8      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_width : constant is 1;
    attribute mti_svvh_generic_type of input_y : constant is 1;
    attribute mti_svvh_generic_type of input_x : constant is 1;
end line_buffer_stride_1_padding_same;
