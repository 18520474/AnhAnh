library verilog;
use verilog.vl_types.all;
entity max2 is
    port(
        d_in_0          : in     vl_logic_vector(31 downto 0);
        d_in_1          : in     vl_logic_vector(31 downto 0);
        d_out           : out    vl_logic_vector(31 downto 0)
    );
end max2;
