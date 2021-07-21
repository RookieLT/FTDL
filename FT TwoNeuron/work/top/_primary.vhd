library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \IN\            : in     vl_logic_vector(127 downto 0);
        Y               : out    vl_logic_vector(127 downto 0)
    );
end top;
