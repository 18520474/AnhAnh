library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        input_valid     : in     vl_logic;
        sof             : in     vl_logic;
        d_in            : in     vl_logic_vector(31 downto 0);
        output_valid    : out    vl_logic;
        d_out           : out    vl_logic_vector(9 downto 0);
        load_weight_done: out    vl_logic
    );
end top;
