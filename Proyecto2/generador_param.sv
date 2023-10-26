module generador_param;
    class generador;
        integer f;

        rand int unsigned pckg_sz;
        rand int unsigned fifo_depth;
        rand int unsigned num_transacciones;

        constraint C0 {pck_sz >= 40 ; pckg_sz < 50};
        constraint C1 {fifo_depth >= 4 ; fifo_depth < 15};
        constraint C2 {num_transacciones >= 5; num_transacciones >= 15};

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

    initial begin
        g0 = new();
        g0.randomize();
        g0.print();
    end

endmodule