library verilog;
use verilog.vl_types.all;
entity taylor is
    generic(
        num_of_int      : integer := 32;
        num_of_frac     : integer := 23
    );
    port(
        IN_X_INT        : in     vl_logic_vector;
        IN_X_FRAC       : in     vl_logic_vector;
        IN_A_FRAC       : in     vl_logic_vector;
        IN_A_INT        : in     vl_logic_vector;
        IN_EXP_INT      : in     vl_logic_vector;
        IN_EXP_FRAC     : in     vl_logic_vector;
        OUT_EXP_INT     : out    vl_logic_vector;
        OUT_EXP_FRAC    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of num_of_int : constant is 1;
    attribute mti_svvh_generic_type of num_of_frac : constant is 1;
end taylor;
