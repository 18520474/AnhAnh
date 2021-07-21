library verilog;
use verilog.vl_types.all;
entity avg_polling is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        input_valid     : in     vl_logic;
        sof             : in     vl_logic;
        o_sof           : out    vl_logic;
        output_valid    : out    vl_logic;
        d_out           : out    vl_logic;
        d_in            : in     vl_logic
    );
end avg_polling;
