class fifo (parameter pckg_sz = 16, parameter deep_fifo = 10);
	bit clk;
	bit [pckg_sz - 1: 0] Din;
	bit [pckg_sz - 1: 0] Dout;
	bit push;
	bit pop;
	bit pndng;
	bit [pckg_sz -1 : 0] cola [$:deep_fifo];

	function new();
		this.clk = 0;
		this.Din = 0;
		this.Dout = 0;
		this.push = 0;
		this.pop = 0;
		this.pndng = 0;
		this.cola = {};
	endfunction
	task.run();
		forever begin
			if(this.cola_in.size() == 0) begin
				pndng = 0;
				$display("El pending esta bajo");
			end
			else begin
				pndng = 1;
				$display("El pending esta alto");
			end
			if(push) begin
				this.cola.push_front(Din);
				$display("Se ha ingresado el dato: %0d", Din);
			end
			
			if(pop) begin
				Dout = this.cola.pop_front();
				$display("Se ha ingresado el dato: %0d", Dout);
			end
			@(posedge clk);
		end
	endtask
endclass
