library verilog;
use verilog.vl_types.all;
entity sum_16 is
    generic(
        input_x         : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0);
        o_sof           : out    vl_logic;
        data_in_0       : in     vl_logic_vector(31 downto 0);
        data_in_1       : in     vl_logic_vector(31 downto 0);
        data_in_2       : in     vl_logic_vector(31 downto 0);
        data_in_3       : in     vl_logic_vector(31 downto 0);
        data_in_4       : in     vl_logic_vector(31 downto 0);
        data_in_5       : in     vl_logic_vector(31 downto 0);
        data_in_6       : in     vl_logic_vector(31 downto 0);
        data_in_7       : in     vl_logic_vector(31 downto 0);
        data_in_8       : in     vl_logic_vector(31 downto 0);
        data_in_9       : in     vl_logic_vector(31 downto 0);
        data_in_10      : in     vl_logic_vector(31 downto 0);
        data_in_11      : in     vl_logic_vector(31 downto 0);
        data_in_12      : in     vl_logic_vector(31 downto 0);
        data_in_13      : in     vl_logic_vector(31 downto 0);
        data_in_14      : in     vl_logic_vector(31 downto 0);
        data_in_15      : in     vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of input_x : constant is 1;
end sum_16;
