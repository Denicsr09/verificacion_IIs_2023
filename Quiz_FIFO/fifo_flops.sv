module fifo_flops #(parameter depth = 16, parameter bits = 32 )(
  input reg [bits-1:0] Dout,
  input [bits-1: 0] Din,
  output push,
  input pop,
  input clk,
  output reg full,
  output reg pndng,
  input rst
  
);
  wire [bits-1 : 0] d [depth-1:0];
//se genera la variable select de tamaño de logaritmo del tamaño definido 
  logic [$clog2(depth)-1:0] select = '1; 
  //este contador funciona para revisar cuando esta llena la mem
  integer cont = 0;
  
  reg[1:0] state;
  logic[1:0] nxt_state;
  //se deninen los 4 estados
  //No hace nada, solo pop, solo push, push y pop
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  
  //funciones que sirven para generar modulos 
  genvar i;
  generate
    //usamos el for para generar la cantidad de manera parametizable 
    for(i=0, i < depth, i + 1)begin: bit_
      
      //generamos las instancias de los flip flops en cadena
      if(i == 0)begin
        ff_d #(.bits(bits)) dff_i(.d(Din), .clk(push), .rst(rst), .q(d[i]));
      end
      else
        ff_d #(.bits(bits)) dff_r(.d(d[i-1]]), .clk(push), .rst(rst), q(d[i]));

    end
  endgenerate
  mux #(.bits(bits), .depth(depth)) muxito(.data_in(d), .select(select), .data_out(Dout));
  
  
  //ctr concatena 2 variables de 1 bit 
  assign ctr={push,pop};
  
  //hace cambios cuando haya un flanco de reloj positivo  
  always_ff @ (posedge clk) begin
    
    if (rst)begin
      state<=s0;
    end 
    else begin
      state<=nxt_state;
    end
  end
  //inicia la maquina de estados de manera combinacional 
  always_comb begin
    
    //usamos una variable full para cuando la memoria esta llena
    //la variable pndg para cuando no haya datos 
    full=0;
    pndng=0;
    
    next_state = current_state; //default state: the same
    
    case(state)
      s0:begin
        if(ctr == 2'b00)begin
          nxt_state = s0;
        end else begin
          nxt_state = s1;
        end
      end
      s1:begin
        if(ctr == 2'b01) begin
          select = select - 1; 
          nxt_state = s0;
        end else begin
          nxt_state = s2;
        end
      end
      s2:begin
        
        if(ctr == 2'b10)begin
          if (cont <= depth)begin
            nxt_state = s0;
            cont = cont + 1;
          end else begin
            //flanco de reloj positivo cuando el contador llegue al maximo
            full=1;
            nxt_state = s0;
        end else begin
          nxt_state = s3;
        end
      end
      s3:begin
        
        if (cont==0)begin
          select = select - 1;
          nxt_state = s0;
          //cuando el contador llegue a cero, sube el pndng
          pndng=1; 
        end 
        
       end
        
    endcase
        
           
  end
  

endmodule
