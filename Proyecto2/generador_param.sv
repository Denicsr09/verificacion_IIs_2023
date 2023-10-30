//Modulo para generar parametros y aleatorizar el tamaño de paquetes, fifo_depth y numero de transacciones
module generador_param;
    class generador;
        integer f;
        //declaracion de variables
        rand int unsigned pckg_sz;
        rand int unsigned fifo_depth;
        rand int unsigned num_transacciones;
        //Constraints para limitar los parametros
        constraint C0 {pckg_sz >= 40 ; pckg_sz < 50;}
        constraint C1 {fifo_depth >= 1 ; fifo_depth < 30;}
        constraint C2 {num_transacciones >= 5; num_transacciones <= 15;}
        //genera un archivo con los parametros para el testbench
        function void print;
            f = $fopen("my_package.sv", "w");
            $fdisplay(f, "package my_package;");
            $fdisplay(f, "  parameter pckg_sz = %0d;", pckg_sz);
            $fdisplay(f, "  parameter fifo_depth = %0d;", fifo_depth);
            $fdisplay(f, "  parameter num_transacciones = %0d;", num_transacciones);
            $fdisplay(f, "endpackage");
        endfunction
    endclass

    generador g0;
    //Para correrlo 
    initial begin
        g0 = new();
        g0.randomize();
        g0.print();
    end

endmodule
