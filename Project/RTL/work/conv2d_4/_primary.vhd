library verilog;
use verilog.vl_types.all;
entity conv2d_4 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        input_valid     : in     vl_logic;
        sof             : in     vl_logic;
        o_sof           : out    vl_logic;
        load_success    : out    vl_logic;
        output_valid    : out    vl_logic;
        d_out           : out    vl_logic;
        d_in            : in     vl_logic
    );
end conv2d_4;
