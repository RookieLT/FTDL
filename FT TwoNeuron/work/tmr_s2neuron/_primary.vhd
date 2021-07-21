library verilog;
use verilog.vl_types.all;
entity tmr_s2neuron is
    generic(
        \N\             : integer := 8;
        S               : integer := 8;
        n               : integer := 32;
        cl              : integer := 8;
        intbits         : integer := 12;
        fracbits        : integer := 32
    );
    port(
        H               : in     vl_logic_vector;
        Wcrc            : in     vl_logic_vector;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        en_s2           : in     vl_logic;
        invalid         : out    vl_logic;
        cfflag          : out    vl_logic;
        Y               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \N\ : constant is 1;
    attribute mti_svvh_generic_type of S : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of cl : constant is 1;
    attribute mti_svvh_generic_type of intbits : constant is 1;
    attribute mti_svvh_generic_type of fracbits : constant is 1;
end tmr_s2neuron;
