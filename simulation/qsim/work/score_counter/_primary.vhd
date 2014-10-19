library verilog;
use verilog.vl_types.all;
entity score_counter is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        carry           : in     vl_logic_vector(4 downto 0);
        sum             : in     vl_logic_vector(4 downto 0);
        count           : out    vl_logic_vector(6 downto 0)
    );
end score_counter;
