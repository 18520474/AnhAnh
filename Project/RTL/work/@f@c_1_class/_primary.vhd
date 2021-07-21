library verilog;
use verilog.vl_types.all;
entity FC_1_class is
    generic(
        weight_path     : string  := "0.txt"
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        d_in            : in     vl_logic;
        d_out           : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of weight_path : constant is 1;
end FC_1_class;
