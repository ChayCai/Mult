 //16位
 module add64
 (
	input [63:0]A,
	input [63:0]B,
	input C_in,
	output [63:0] F,
	output Gm,
	output Pm,
	output C_out
 );
 wire [3:0]G;
 wire [3:0]P;
 wire [4:1]C;
add16 A0
 (
	.A(A[15:0]),
	.B(B[15:0]),
	.C_in(C_in),
	.F(F[15:0]),
	.Gm(G[0]),
	.Pm(P[0]),
	.C_out(C[1])
 );
 add16 A1
 (
	.A(A[31:16]),
	.B(B[31:16]),
	.C_in(C[1]),
	.F(F[31:16]),
	.Gm(G[1]),
	.Pm(P[1]),
	.C_out(C[2])
 );
 add16 A3
 (
	.A(A[47:32]),
	.B(B[47:32]),
	.C_in(C[2]),
	.F(F[47:32]),
	.Gm(G[2]),
	.Pm(P[2]),
	.C_out(C[3])
 );
 add16 A4
 (
	.A(A[63:48]),
	.B(B[63:48]),
	.C_in(C[3]),
	.F(F[63:48]),
	.Gm(G[3]),
	.Pm(P[3]),
	.C_out(C[4])
 );
  CLA_4 AAt
 (
	.P(P),
	.G(G),
	.C_in(C_in),
	.Ci(C),
	.Gm(Gm),
	.Pm(Pm)
 );
 assign C_out=C[4];
 endmodule
