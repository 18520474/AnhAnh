library verilog;
use verilog.vl_types.all;
entity line_buffer_control_stride_1_no_padding is
    generic(
        input_y         : integer := 6
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sof             : in     vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of input_y : constant is 1;
end line_buffer_control_stride_1_no_padding;
