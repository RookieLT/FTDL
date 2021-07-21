library verilog;
use verilog.vl_types.all;
entity s1neuron is
    generic(
        M               : integer := 8;
        n               : integer := 32;
        cl              : integer := 8;
        intbits         : integer := 12;
        fracbits        : integer := 20
    );
    port(
        X               : in     vl_logic_vector;
        Wcrc            : in     vl_logic_vector;
        clk             : in     vl_logic;
        rfflag          : out    vl_logic;
        H               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of M : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of cl : constant is 1;
    attribute mti_svvh_generic_type of intbits : constant is 1;
    attribute mti_svvh_generic_type of fracbits : constant is 1;
end s1neuron;
