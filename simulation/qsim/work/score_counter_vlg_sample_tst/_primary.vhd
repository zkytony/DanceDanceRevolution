library verilog;
use verilog.vl_types.all;
entity score_counter_vlg_sample_tst is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        carry           : in     vl_logic_vector(4 downto 0);
        sum             : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end score_counter_vlg_sample_tst;
