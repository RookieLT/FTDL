library verilog;
use verilog.vl_types.all;
entity tmr_adder_tree is
    generic(
        m               : integer := 8;
        n               : integer := 16;
        intbits         : integer := 6;
        fracbits        : integer := 10
    );
    port(
        operand         : in     vl_logic_vector;
        invalid         : out    vl_logic;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of m : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of intbits : constant is 1;
    attribute mti_svvh_generic_type of fracbits : constant is 1;
end tmr_adder_tree;
