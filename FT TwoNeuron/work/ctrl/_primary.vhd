library verilog;
use verilog.vl_types.all;
entity ctrl is
    generic(
        S               : integer := 8;
        addrwidth       : integer := 3
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rfflag          : in     vl_logic;
        cfflag          : in     vl_logic;
        en_s2           : out    vl_logic;
        addr_r          : out    vl_logic_vector;
        addr_c          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S : constant is 1;
    attribute mti_svvh_generic_type of addrwidth : constant is 1;
end ctrl;
