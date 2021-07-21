library verilog;
use verilog.vl_types.all;
entity tb_s1neuron is
    generic(
        M               : integer := 8;
        n               : integer := 16;
        cl              : integer := 8;
        intbits         : integer := 6;
        fracbits        : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of M : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of cl : constant is 1;
    attribute mti_svvh_generic_type of intbits : constant is 1;
    attribute mti_svvh_generic_type of fracbits : constant is 1;
end tb_s1neuron;
