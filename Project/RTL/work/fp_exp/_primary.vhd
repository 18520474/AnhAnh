library verilog;
use verilog.vl_types.all;
entity fp_exp is
    generic(
        num_of_frac     : integer := 23
    );
    port(
        IN_FLOAT32      : in     vl_logic_vector(31 downto 0);
        OUT_FLOAT32     : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of num_of_frac : constant is 1;
end fp_exp;
