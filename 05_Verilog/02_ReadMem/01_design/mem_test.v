module mem_test(clk, rst_n, d, addr, cs, we, q);

//parameter
parameter MEM_FILE = "mem_content.txt";

//input
input clk;
input rst_n;
input [15:0] d;
input [2:0] addr;
input cs;
input we;

//output
output [15:0] q;
reg    [15:0] q;

//internal signal
reg [15:0] mem_internal [0:7];

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        q <= 15'b0;
    end
    else if(cs && we) begin
        mem_internal[addr] <= d;
    end
    else if(cs && (!we)) begin
        q <= mem_internal[addr];
    end
   // Why is not enough cases ? 
end

initial begin
      $readmemh(MEM_FILE, mem_internal);
end


endmodule
