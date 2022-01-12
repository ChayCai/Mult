`timescale 1 ns / 10ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: CaiChang
// 
// Create Date: 2021/12/01 14:26:38
// Design Name: 
// Module Name: coms
// Project Name: multiplier
// Target Devices: 
// Tool Versions: 
// Description: 
//              a 32x32 multiplier with booth2 algorithm and jump wallace tree
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module com_s(
    input a,
    input b,
    input c,
    input d,
    output s,
    output ca,
    output co
);

wire temp;
assign temp = a ^ b ^ c ^ d;
assign s = temp;
assign ca = d & ~temp;
assign co = (a & b)||(b & c)||(a & c);

endmodule