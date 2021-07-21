library verilog;
use verilog.vl_types.all;
entity crc is
    port(
        data            : in     vl_logic_vector(7 downto 0);
        newcrc          : out    vl_logic_vector(7 downto 0)
    );
end crc;
