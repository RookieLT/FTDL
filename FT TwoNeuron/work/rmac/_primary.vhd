library verilog;
use verilog.vl_types.all;
entity rmac is
    generic(
        S               : integer := 8;
        n               : integer := 32;
        intbits         : integer := 12;
        fracbits        : integer := 20
    );
    port(
        W               : in     vl_logic_vector;
        X               : in     vl_logic_vector;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        en_s2           : in     vl_logic;
        local_en        : in     vl_logic;
        sum             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of intbits : constant is 1;
    attribute mti_svvh_generic_type of fracbits : constant is 1;
end rmac;
