library verilog;
use verilog.vl_types.all;
entity sum_10 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0);
        data_in_0       : in     vl_logic_vector(31 downto 0);
        data_in_1       : in     vl_logic_vector(31 downto 0);
        data_in_2       : in     vl_logic_vector(31 downto 0);
        data_in_3       : in     vl_logic_vector(31 downto 0);
        data_in_4       : in     vl_logic_vector(31 downto 0);
        data_in_5       : in     vl_logic_vector(31 downto 0);
        data_in_6       : in     vl_logic_vector(31 downto 0);
        data_in_7       : in     vl_logic_vector(31 downto 0);
        data_in_8       : in     vl_logic_vector(31 downto 0);
        data_in_9       : in     vl_logic_vector(31 downto 0)
    );
end sum_10;
