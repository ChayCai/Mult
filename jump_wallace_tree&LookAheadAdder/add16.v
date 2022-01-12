 //16位
 module add16
 (
	input [15:0]A,
	input [15:0]B,
	input C_in,
	output [15:0] F,
	output Gm,
	output Pm,
	output C_out
 );
 wire [3:0]G;
 wire [3:0]P;
 wire [4:1]C;
add4 A0
 (
	.A(A[3:0]),
	.B(B[3:0]),
	.C_in(C_in),
	.F(F[3:0]),
	.Gm(G[0]),
	.Pm(P[0]),
	.C_out(C[1])
 );
 add4 A1
 (
	.A(A[7:4]),
	.B(B[7:4]),
	.C_in(C[1]),
	.F(F[7:4]),
	.Gm(G[1]),
	.Pm(P[1]),
	.C_out(C[2])
 );
 add4 A3
 (
	.A(A[11:8]),
	.B(B[11:8]),
	.C_in(C[2]),
	.F(F[11:8]),
	.Gm(G[2]),
	.Pm(P[2]),
	.C_out(C[3])
 );
 add4 A4
 (
	.A(A[15:12]),
	.B(B[15:12]),
	.C_in(C[3]),
	.F(F[15:12]),
	.Gm(G[3]),
	.Pm(P[3]),
	.C_out()
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
