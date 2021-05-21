`timescale 1ns / 1ps
/*
module overflowclockdivider(
    input wire clk,
    input wire reset,
    input wire enable,
    output wire dividedClk
    );
    reg [16:0] counter;
always @(posedge clk) begin
    if (reset == 1) begin
    counter <= 17'd0;
    end else if (enable == 1) begin
    counter <= counter + 1'b1;
    end 
else begin
counter <= counter; 
end
end
 assign dividedClk = counter[16];
endmodule
*/

/*In order to change the frequency from 100MHz to 1Hz, I need to figure out the n in the formula 1=100*106 / 2^n. 
The result of n is 26.57, so when n equals to 27, the corresponding frequency will be the closest to 1Hz. 
The precise frequency equals to 100*106 / 227, which is 0.745Hz. The corresponding period is 1.342s.*/

module overflowclockdivider(
    input wire clk,
    input wire reset,
    input wire enable,
    output wire dividedClk
    );
    reg [26:0] counter;
always @(posedge clk) begin
if (reset == 1) begin
counter <= 27'd0;
end else if (enable == 1) begin
counter <= counter + 1'b1;
end else begin
counter <= counter; 
end
end
 assign dividedClk = counter[26];
endmodule
