library verilog;
use verilog.vl_types.all;
entity output_control is
    generic(
        output_x        : integer := 4;
        output_y        : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        output_valid    : in     vl_logic;
        o_sof           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of output_x : constant is 1;
    attribute mti_svvh_generic_type of output_y : constant is 1;
end output_control;
