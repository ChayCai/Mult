`timescale 1 ns / 10ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: CaiChang
// 
// Create Date: 2021/12/01 11:28:49
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

module ha(
    input a,
    input b,
    output co,
    output s
);

assign co = a & b;
assign s = a ^ b;

endmodule