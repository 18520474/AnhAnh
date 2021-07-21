library verilog;
use verilog.vl_types.all;
entity scale is
    generic(
        scale_param     : integer := 973279855
    );
    port(
        d_in            : in     vl_logic;
        d_out           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of scale_param : constant is 1;
end scale;
