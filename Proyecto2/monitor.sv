class monitor #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) mnr_ckr_mbx;
  
  virtual mesh_gnrtr_vif  #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(deep_fifo)) vif;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
  
	bit pop;
	bit [pckg_sz -1 : 0] cola [$:deep_fifo];
    int mnr_num;
  	//int tiempo_out; 
  int terminales [] = {01,02,03,04,10,20,30,40,51,52,53,54,15,25,35,45};
  int compr_row;
  int compr_colum;
  function new(int mnr_num);
      

		this.pop= 0;
    	this.mnr_num=mnr_num;
    	//this.tiempo_out=tiempo;

	endfunction
 
  task run();
    
    this.vif.pop[this.mnr_num]=0;
    
    forever begin
      @(posedge vif.clk);
      
      //$display("Señal de pndng y dato, pndng=%d dato de salida= %d",this.vif.pndng[mnr_num],this.vif.data_out[mnr_num]);
     
      
      if(this.vif.pndng[this.mnr_num]) begin
        
        transaccion = new(); 
        transaccion.dato=this.vif.data_out[mnr_num];
        
          
        transaccion.tiempo=$time;
        mnr_ckr_mbx.put(transaccion);
        
        $display("Transaccion enviada desde monitor,Source= %d dato=%h", mnr_num,transaccion.dato);
        
        if(vif.data_out[mnr_num] != 0) begin
          $display("target %d y terminal %d,dato %b",transaccion.dato[pckg_sz-9 : pckg_sz-16],terminales[mnr_num],transaccion.dato);
          assert(transaccion.dato[pckg_sz-9 : pckg_sz-16] == terminales[mnr_num])
          else $warning("Dato no llego a la terminal correcta");
        end
        
        
        this.vif.pop[mnr_num]=1;
        @(posedge vif.clk);
      end
      else begin
        this.vif.pop[mnr_num]=0;
      end
      //#5;
    end
    
  endtask
  

	
    
endclass
