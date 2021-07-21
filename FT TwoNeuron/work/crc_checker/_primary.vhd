library verilog;
use verilog.vl_types.all;
entity crc_checker is
    generic(
        n               : integer := 16;
        cl              : integer := 8
    );
    port(
        din             : in     vl_logic_vector;
        dout            : out    vl_logic_vector;
        fflag           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of cl : constant is 1;
end crc_checker;
