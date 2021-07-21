library verilog;
use verilog.vl_types.all;
entity priority_encoder is
    port(
        significand     : in     vl_logic_vector(24 downto 0);
        exp_a           : in     vl_logic_vector(7 downto 0);
        \Significand\   : out    vl_logic_vector(24 downto 0);
        exp_sub         : out    vl_logic_vector(7 downto 0)
    );
end priority_encoder;
