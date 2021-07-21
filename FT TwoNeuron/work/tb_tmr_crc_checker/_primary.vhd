library verilog;
use verilog.vl_types.all;
entity tb_tmr_crc_checker is
    generic(
        n               : integer := 16;
        cl              : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of cl : constant is 1;
end tb_tmr_crc_checker;
