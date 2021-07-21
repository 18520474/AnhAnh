library verilog;
use verilog.vl_types.all;
entity load_weight_fc is
    generic(
        path            : string  := "weight.txt"
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        load_done       : out    vl_logic;
        w_0             : out    vl_logic_vector(31 downto 0);
        w_1             : out    vl_logic_vector(31 downto 0);
        w_2             : out    vl_logic_vector(31 downto 0);
        w_3             : out    vl_logic_vector(31 downto 0);
        w_4             : out    vl_logic_vector(31 downto 0);
        w_5             : out    vl_logic_vector(31 downto 0);
        w_6             : out    vl_logic_vector(31 downto 0);
        w_7             : out    vl_logic_vector(31 downto 0);
        w_8             : out    vl_logic_vector(31 downto 0);
        w_9             : out    vl_logic_vector(31 downto 0);
        w_10            : out    vl_logic_vector(31 downto 0);
        w_11            : out    vl_logic_vector(31 downto 0);
        w_12            : out    vl_logic_vector(31 downto 0);
        w_13            : out    vl_logic_vector(31 downto 0);
        w_14            : out    vl_logic_vector(31 downto 0);
        w_15            : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of path : constant is 1;
end load_weight_fc;
