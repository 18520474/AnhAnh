library verilog;
use verilog.vl_types.all;
entity avg_apply is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        input_valid     : in     vl_logic;
        output_valid    : out    vl_logic;
        IN_1            : in     vl_logic_vector(31 downto 0);
        IN_2            : in     vl_logic_vector(31 downto 0);
        IN_3            : in     vl_logic_vector(31 downto 0);
        IN_4            : in     vl_logic_vector(31 downto 0);
        IN_5            : in     vl_logic_vector(31 downto 0);
        IN_6            : in     vl_logic_vector(31 downto 0);
        IN_7            : in     vl_logic_vector(31 downto 0);
        IN_8            : in     vl_logic_vector(31 downto 0);
        IN_9            : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end avg_apply;
