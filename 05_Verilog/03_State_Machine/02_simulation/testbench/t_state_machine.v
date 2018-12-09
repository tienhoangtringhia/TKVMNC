
//========= FIle : t_state_machine.v

module t_state_machine;

//inputs define
reg t_clk;
reg t_rst_n;
reg t_n;
reg t_w;

//output define
wire t_b;

//clock define
always begin
      t_clk = 1'b0;
    # 50;
      t_clk = 1'b1;
    # 50;
end

//instance define
state_machine state_machine_01 (.clk(t_clk), .rst_n(t_rst_n), .w(t_w), .b(t_b));
//display the output
initial begin
//    $monitor("time=%d, system_clock=%b, system_rst_n=%b, t_first_data_in:%b, t_second_data_in:%b, data_out_and_gate=%b \n", 
//             $stime,    t_system_clock,  t_system_rst_n, t_first_data_in,    t_second_data_in,    t_data_out_and_gate);
end

//Declare Testcases
initial begin
  #1   t_rst_n = 0;
       t_w = 0;
  #10  t_rst_n = 1;
  #300  t_w = 1;
  #300  t_w = 0;
  #300  t_w = 1;
  #300  t_w = 0;
  #100 $finish;
end

initial begin
   $vcdplusfile ("examp1_and_gate.vpd");
   $vcdpluson();
end

endmodule
