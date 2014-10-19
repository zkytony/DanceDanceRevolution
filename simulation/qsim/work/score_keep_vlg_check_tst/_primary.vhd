library verilog;
use verilog.vl_types.all;
entity score_keep_vlg_check_tst is
    port(
        hex0            : in     vl_logic_vector(6 downto 0);
        hex1            : in     vl_logic_vector(6 downto 0);
        s0              : in     vl_logic_vector(4 downto 0);
        s1              : in     vl_logic_vector(4 downto 0);
        s2              : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end score_keep_vlg_check_tst;
