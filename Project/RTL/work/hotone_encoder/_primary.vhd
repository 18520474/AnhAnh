library verilog;
use verilog.vl_types.all;
entity hotone_encoder is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        d_in            : in     vl_logic;
        d_out           : out    vl_logic_vector(9 downto 0)
    );
end hotone_encoder;
