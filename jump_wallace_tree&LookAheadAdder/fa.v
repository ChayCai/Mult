`timescale 1 ns / 10ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: CaiChang
// 
// Create Date: 2021/12/01 11:20:32
// Design Name: 
// Module Name: com42
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


module fa(
    input a,
    input b,
    input c,
    output co,
    output s
);

assign co = (a&b)|(b&c)|(a&c);
assign s = c ? (a ^~ b) : (a ^ b);

endmodule
