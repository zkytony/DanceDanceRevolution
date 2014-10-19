library verilog;
use verilog.vl_types.all;
entity score_keep_vlg_sample_tst is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        pt_0            : in     vl_logic_vector(4 downto 0);
        pt_1            : in     vl_logic_vector(4 downto 0);
        pt_2            : in     vl_logic_vector(4 downto 0);
        pt_3            : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end score_keep_vlg_sample_tst;
