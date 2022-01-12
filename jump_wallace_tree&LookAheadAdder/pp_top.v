`timescale 1 ns / 10ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: CaiChang
// 
// Create Date: 2021/11/30 16:12:10
// Design Name: 
// Module Name: pp_top
// Project Name: mult
// Target Devices: 
// Tool Versions: 
// Description: 
//              a 32x32 multiplier with booth2 algorithm and jump wallace tree
//              top pp generator
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pp_top(
    input wire [31 : 0] x,
    input wire [31 : 0] y,
    output wire [32 : 0] pp0,
    output wire [32 : 0] pp1,
    output wire [32 : 0] pp2,
    output wire [32 : 0] pp3,
    output wire [32 : 0] pp4,
    output wire [32 : 0] pp5,
    output wire [32 : 0] pp6,
    output wire [32 : 0] pp7,
    output wire [32 : 0] pp8,
    output wire [32 : 0] pp9,
    output wire [32 : 0] pp10,
    output wire [32 : 0] pp11,
    output wire [32 : 0] pp12,
    output wire [32 : 0] pp13,
    output wire [32 : 0] pp14,
    output wire [32 : 0] pp15,
    output wire [15 : 0] E
);

reg [32 : 0] r_pp0;

always @(x or y[1:0])
begin
  case(y[1 : 0]) 
    2'b00:  begin  r_pp0[32 : 0] = 33'd0;                       end 
    2'b01:  begin  r_pp0[32 : 0] = {x[31], x[31 : 0]};          end 
    2'b10:  begin  r_pp0[32 : 0] = {~x[31 : 0], 1'b1};          end 
    2'b11:  begin  r_pp0[32 : 0] = {~x[31] , ~x[31 : 0]};       end 
  endcase 
end

assign pp0 = r_pp0;
assign E[0] = ( (~x[31]) & (~y[1]) ) | ( x[31] & y[1] ) | ( x[31] & (~y[0]) ); 

pp pp_1
(
    .x(x),
    .py(y[3 : 1]),
    .pp(pp1),
    .E(E[1])
);

pp pp_2
(
    .x(x),
    .py(y[5 : 3]),
    .pp(pp2),
    .E(E[2])
);

pp pp_3
(
    .x(x),
    .py(y[7 : 5]),
    .pp(pp3),
    .E(E[3])
);

pp pp_4
(
    .x(x),
    .py(y[9 : 7]),
    .pp(pp4),
    .E(E[4])
);

pp pp_5
(
    .x(x),
    .py(y[11 : 9]),
    .pp(pp5),
    .E(E[5])
);

pp pp_6
(
    .x(x),
    .py(y[13 : 11]),
    .pp(pp6),
    .E(E[6])
);

pp pp_7
(
    .x(x),
    .py(y[15 : 13]),
    .pp(pp7),
    .E(E[7])
);

pp pp_8
(
    .x(x),
    .py(y[17 : 15]),
    .pp(pp8),
    .E(E[8])
);

pp pp_9
(
    .x(x),
    .py(y[19 : 17]),
    .pp(pp9),
    .E(E[9])
);

pp pp_10
(
    .x(x),
    .py(y[21 : 19]),
    .pp(pp10),
    .E(E[10])
);

pp pp_11
(
    .x(x),
    .py(y[23 : 21]),
    .pp(pp11),
    .E(E[11])
);

pp pp_12
(
    .x(x),
    .py(y[25 : 23]),
    .pp(pp12),
    .E(E[12])
);

pp pp_13
(
    .x(x),
    .py(y[27 : 25]),
    .pp(pp13),
    .E(E[13])
);

pp pp_14
(
    .x(x),
    .py(y[29 : 27]),
    .pp(pp14),
    .E(E[14])
);

pp pp_15
(
    .x(x),
    .py(y[31 : 29]),
    .pp(pp15),
    .E(E[15])
);




endmodule