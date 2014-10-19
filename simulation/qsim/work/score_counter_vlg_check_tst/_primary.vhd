library verilog;
use verilog.vl_types.all;
entity score_counter_vlg_check_tst is
    port(
        count           : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end score_counter_vlg_check_tst;
