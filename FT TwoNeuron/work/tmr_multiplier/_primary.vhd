library verilog;
use verilog.vl_types.all;
entity tmr_multiplier is
    generic(
        n               : integer := 16;
        intbits         : integer := 6;
        fracbits        : integer := 10
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        result          : out    vl_logic_vector;
        invalid         : out    vl_logic;
        ovf             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of intbits : constant is 1;
    attribute mti_svvh_generic_type of fracbits : constant is 1;
end tmr_multiplier;
