// `timescale 1 ns / 10ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: CaiChang
// 
// Create Date: 2021/12/01 09:34:44
// Design Name: 
// Module Name: multiplier
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

module multiplier(
    input [31 : 0] x,
    input [31 : 0] y,
    input clk,
    output reg [63 : 0] r_P
);

reg [31 : 0] r_x,r_y;
wire [63 : 0]P;
wire [32 : 0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15;
wire [15 : 0] E;
wire [63 : 0] add0,add1;

always @(posedge clk)
begin
r_x <= x;
r_y <= y;
r_P <= P;
end

pp_top booth2_pp
(
    .x(r_x),
    .y(r_y),
    .E(E),
    .pp0(pp0),
    .pp1(pp1),
    .pp2(pp2),
    .pp3(pp3),
    .pp4(pp4),
    .pp5(pp5),
    .pp6(pp6),
    .pp7(pp7),
    .pp8(pp8),
    .pp9(pp9),
    .pp10(pp10),
    .pp11(pp11),
    .pp12(pp12),
    .pp13(pp13),
    .pp14(pp14),
    .pp15(pp15)
);

wallace_tree tree
(
    .p0(pp0),
    .p1(pp1),
    .p2(pp2),
    .p3(pp3),
    .p4(pp4),
    .p5(pp5),
    .p6(pp6),
    .p7(pp7),
    .p8(pp8),
    .p9(pp9),
    .p10(pp10),
    .p11(pp11),
    .p12(pp12),
    .p13(pp13),
    .p14(pp14),
    .p15(pp15),
    .E(E),
    .y(r_y),
    .add0(add0),
    .add1(add1)
);

add64 adder
(
    .A(add0),
    .B(add1),
    .C_in(1'b0),
    .F(P)
);

endmodule