library verilog;
use verilog.vl_types.all;
entity conv2d is
    generic(
        weight_path     : string  := "test_weight.txt";
        is_relu         : integer := 0;
        stride          : integer := 1;
        padding         : integer := 0;
        input_x         : integer := 5;
        input_y         : integer := 5
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sof             : in     vl_logic;
        load            : in     vl_logic;
        o_sof           : out    vl_logic;
        load_success    : out    vl_logic;
        d_in            : in     vl_logic_vector(31 downto 0);
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        d_out           : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of weight_path : constant is 1;
    attribute mti_svvh_generic_type of is_relu : constant is 1;
    attribute mti_svvh_generic_type of stride : constant is 1;
    attribute mti_svvh_generic_type of padding : constant is 1;
    attribute mti_svvh_generic_type of input_x : constant is 1;
    attribute mti_svvh_generic_type of input_y : constant is 1;
end conv2d;
