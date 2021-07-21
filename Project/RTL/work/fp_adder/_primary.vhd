library verilog;
use verilog.vl_types.all;
entity fp_adder is
    port(
        a_operand       : in     vl_logic_vector(31 downto 0);
        b_operand       : in     vl_logic_vector(31 downto 0);
        AddBar_Sub      : in     vl_logic;
        result          : out    vl_logic_vector(31 downto 0)
    );
end fp_adder;
