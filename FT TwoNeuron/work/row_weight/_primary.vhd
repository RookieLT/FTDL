library verilog;
use verilog.vl_types.all;
entity row_weight is
    generic(
        M               : integer := 8;
        S               : integer := 8;
        n               : integer := 32;
        cl              : integer := 8;
        addrwidth       : integer := 2
    );
    port(
        addr            : in     vl_logic_vector;
        W               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of M : constant is 1;
    attribute mti_svvh_generic_type of S : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of cl : constant is 1;
    attribute mti_svvh_generic_type of addrwidth : constant is 1;
end row_weight;
