library verilog;
use verilog.vl_types.all;
entity filter_apply is
    generic(
        is_relu         : integer := 0
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        data_in_0       : in     vl_logic_vector(31 downto 0);
        data_in_1       : in     vl_logic_vector(31 downto 0);
        data_in_2       : in     vl_logic_vector(31 downto 0);
        data_in_3       : in     vl_logic_vector(31 downto 0);
        data_in_4       : in     vl_logic_vector(31 downto 0);
        data_in_5       : in     vl_logic_vector(31 downto 0);
        data_in_6       : in     vl_logic_vector(31 downto 0);
        data_in_7       : in     vl_logic_vector(31 downto 0);
        data_in_8       : in     vl_logic_vector(31 downto 0);
        w_in_0          : in     vl_logic_vector(31 downto 0);
        w_in_1          : in     vl_logic_vector(31 downto 0);
        w_in_2          : in     vl_logic_vector(31 downto 0);
        w_in_3          : in     vl_logic_vector(31 downto 0);
        w_in_4          : in     vl_logic_vector(31 downto 0);
        w_in_5          : in     vl_logic_vector(31 downto 0);
        w_in_6          : in     vl_logic_vector(31 downto 0);
        w_in_7          : in     vl_logic_vector(31 downto 0);
        w_in_8          : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of is_relu : constant is 1;
end filter_apply;
