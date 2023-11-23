module generador_param;
    class generador;
        integer f;
        rand int unsigned pckg_sz;
        rand int unsigned deep_fifo;
        rand int unsigned num_transaciones;
        int unsigned ROWS = 4;
        int unsigned COLUMS = 4;
        //Constraints para limitar los parametros
        constraint C0 {pckg_sz >= 35 ; pckg_sz < 50;}
        constraint C1 {deep_fifo >= 1 ; deep_fifo < 30;}
        constraint C2 {num_transaciones >= 500; num_transaciones <= 1000;}

        function void printmacros;
            f = $fopen("macros2.sv","w");
            $fdisplay(f, "`define pckg_sz %0d", pckg_sz);
            $fdisplay(f, "`define deep_fifo %0d", deep_fifo );
            $fdisplay(f, "`define num_transaciones  %0d", num_transaciones );
            $fdisplay(f, "`define ROWS %0d", ROWS );
            $fdisplay(f, "`define COLUMS %0d", COLUMS );
        endfunction
    endclass
    generador gen_define;

    initial begin
        gen_define = new();
        gen_define.randomize;
        gen_define.printmacros();
    end

endmodule
