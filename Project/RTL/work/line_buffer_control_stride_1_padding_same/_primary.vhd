library verilog;
use verilog.vl_types.all;
entity line_buffer_control_stride_1_padding_same is
    generic(
        input_y         : integer := 3;
        input_x         : integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sof             : in     vl_logic;
        busy            : out    vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        is_pad_0        : out    vl_logic;
        is_pad_1        : out    vl_logic;
        is_pad_2        : out    vl_logic;
        is_pad_3        : out    vl_logic;
        is_pad_4        : out    vl_logic;
        is_pad_5        : out    vl_logic;
        is_pad_6        : out    vl_logic;
        is_pad_7        : out    vl_logic;
        is_pad_8        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of input_y : constant is 1;
    attribute mti_svvh_generic_type of input_x : constant is 1;
end line_buffer_control_stride_1_padding_same;
