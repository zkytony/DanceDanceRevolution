library verilog;
use verilog.vl_types.all;
entity score_keep is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        pt_0            : in     vl_logic_vector(4 downto 0);
        pt_1            : in     vl_logic_vector(4 downto 0);
        pt_2            : in     vl_logic_vector(4 downto 0);
        pt_3            : in     vl_logic_vector(4 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        s0              : out    vl_logic_vector(4 downto 0);
        s1              : out    vl_logic_vector(4 downto 0);
        s2              : out    vl_logic_vector(4 downto 0)
    );
end score_keep;
