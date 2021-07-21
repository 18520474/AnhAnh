library verilog;
use verilog.vl_types.all;
entity fifo is
    generic(
        bit_witdth      : integer := 32
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        buf_in          : in     vl_logic_vector;
        buf_out         : out    vl_logic_vector;
        wr_en           : in     vl_logic;
        rd_en           : in     vl_logic;
        buf_empty       : out    vl_logic;
        buf_full        : out    vl_logic;
        fifo_counter    : out    vl_logic_vector(12 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bit_witdth : constant is 1;
end fifo;
