class fifo (parameter pckg_sz = 16, parameter deep_fifo = 10);
	bit clk;
	bit [pckg_sz - 1: 0] Din;
	bit [pckg_sz - 1: 0] Dout;
	bit push;
	bit pop;
	bit pndng;
	bit [pckg_sz -1 : 0] cola_out[$:deep_fifo];
endclass
