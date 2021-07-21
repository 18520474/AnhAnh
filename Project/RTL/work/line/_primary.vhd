library verilog;
use verilog.vl_types.all;
entity line is
    generic(
        input_y         : integer := 15;
        data_width      : integer := 32
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        data_in         : in     vl_logic_vector;
        data_out_0      : out    vl_logic_vector;
        data_out_1      : out    vl_logic_vector;
        data_out_2      : out    vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of input_y : constant is 1;
    attribute mti_svvh_generic_type of data_width : constant is 1;
end line;
