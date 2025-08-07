
module tb_mux4to1;

    reg [1:0] sel;
    reg [3:0] in;

    wire out_assign;
    wire out_case;
    wire out_if;


    mux4to1_if mux_if (
        .sel(sel),
        .in(in),
        .out(out_if)
    );

    initial begin
      $dumpfile("mux4to1_if.vcd");
      $dumpvars;
        $display("Time\tSel\tIn\tAssign\tCase\tIf");
        $monitor("%0t\t%02b\t%b\t%b\t%b\t%b", 
                  $time, sel, in, out_if);

        in = 4'b1010;  

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        in = 4'b0101;  
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end

endmodule