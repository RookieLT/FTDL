library verilog;
use verilog.vl_types.all;
entity adder_tree is
    generic(
        m               : integer := 8;
        n               : integer := 32;
        intbits         : integer := 12;
        fracbits        : integer := 20
    );
    port(
        operand         : in     vl_logic_vector;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of m : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of intbits : constant is 1;
    attribute mti_svvh_generic_type of fracbits : constant is 1;
end adder_tree;
