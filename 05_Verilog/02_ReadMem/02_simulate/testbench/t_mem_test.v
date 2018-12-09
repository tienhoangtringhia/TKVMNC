
//========= FIle : t_mem_test.v


module t_mem_test;

//parameter define
parameter DATA_WIDTH = 16;
parameter ADDRESS_WIDTH = 16;

//inputs define
reg t_clock;
reg t_rst_n;
reg [DATA_WIDTH-1:0] t_d;
wire [DATA_WIDTH-1:0] t_q;

reg [ADDRESS_WIDTH-1:0] t_addr;
reg t_cs;
reg t_we;

reg t_clk;

//clock define
always begin
      t_clk = 1'b0;
    # 50;
      t_clk = 1'b1;
    # 50;
end

//instance define
mem_test mem_test_01 (.clk(t_clk), .rst_n(t_rst_n), .d(t_d), .addr(t_addr), .cs(t_cs), .we(t_we), .q(t_q));

//display the output
initial begin
  //  $monitor("time=%d, system_clock=%b, system_rst_n=%b, t_first_data_in:%b, t_second_data_in:%b, data_out_and_gate=%b \n", 
  //           $stime,    t_system_clock,  t_system_rst_n, t_first_data_in,    t_second_data_in,    t_data_out_and_gate);
end

//Declare Testcases
initial begin
  #1   t_rst_n = 0;
       t_cs = 0;
       t_we = 0;
       t_addr = 0;
       t_d = 0;

  #10  t_rst_n = 1;
       t_cs = 1;

  #100 t_we = 1;
  #50  t_d  = 15;

  #100 t_addr = 3;

  #50  t_d  = 16;
  
  #50 t_addr = 5;

  #100 t_we = 0;
 
  #100 t_addr = 3;

  #1000 $finish;
end

initial begin
   $vcdplusfile ("memory.vpd");
   $vcdpluson();
end

endmodule
