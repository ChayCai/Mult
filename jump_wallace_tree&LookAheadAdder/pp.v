`timescale 1 ns / 10ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: CaiChang
// 
// Create Date: 2021/11/30 16:00:13
// Design Name: 
// Module Name: pp
// Project Name: mult
// Target Devices: 
// Tool Versions: 
// Description: 
//              a 32x32 multiplier with booth2 algorithm and jump wallace tree
//              pp generator
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pp(
    input wire [31 : 0] x,
    input wire [2 : 0] py,
    output reg [32 : 0] pp,
    output wire E
);

always @(x or py)
begin
  case(py[2:0])
    3'b000: begin  pp[32 : 0] = 33'd0;                      end 
    3'b001: begin  pp[32 : 0] = {x[31], x[31 : 0]};         end 
    3'b010: begin  pp[32 : 0] = {x[31], x[31 : 0]};          end 
    3'b011: begin  pp[32 : 0] = {x[31 : 0], 1'b0};          end
    3'b100: begin  pp[32 : 0] = {~x[31 : 0], 1'b1};          end 
    3'b101: begin  pp[32 : 0] = {~x[31], ~x[31 : 0]};        end 
    3'b110: begin  pp[32 : 0] = {~x[31], ~x[31 : 0]};        end 
    3'b111: begin  pp[32 : 0] = 33'h1ffffffff;               end 
   endcase 
end

assign E = ( (~x[31]) & (~py[2]) ) | ( x[31] & py[2] & (~py[1]) ) |  
                 ( x[31] & (~py[1]) & (~py[0]) ) | ( x[31] & py[2] & py[1] & (~py[0]) ); 

endmodule