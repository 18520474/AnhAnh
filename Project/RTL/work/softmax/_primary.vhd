library verilog;
use verilog.vl_types.all;
entity softmax is
    port(
        clk             : in     vl_logic;
        resetn          : in     vl_logic;
        valid_in        : in     vl_logic;
        class0          : in     vl_logic_vector(31 downto 0);
        class1          : in     vl_logic_vector(31 downto 0);
        class2          : in     vl_logic_vector(31 downto 0);
        class3          : in     vl_logic_vector(31 downto 0);
        class4          : in     vl_logic_vector(31 downto 0);
        class5          : in     vl_logic_vector(31 downto 0);
        class6          : in     vl_logic_vector(31 downto 0);
        class7          : in     vl_logic_vector(31 downto 0);
        class8          : in     vl_logic_vector(31 downto 0);
        class9          : in     vl_logic_vector(31 downto 0);
        percent0        : out    vl_logic_vector(31 downto 0);
        percent1        : out    vl_logic_vector(31 downto 0);
        percent2        : out    vl_logic_vector(31 downto 0);
        percent3        : out    vl_logic_vector(31 downto 0);
        percent4        : out    vl_logic_vector(31 downto 0);
        percent5        : out    vl_logic_vector(31 downto 0);
        percent6        : out    vl_logic_vector(31 downto 0);
        percent7        : out    vl_logic_vector(31 downto 0);
        percent8        : out    vl_logic_vector(31 downto 0);
        percent9        : out    vl_logic_vector(31 downto 0);
        valid_out       : out    vl_logic
    );
end softmax;
