//四位超前进位加法器
module add4
(
	input [3:0]A,
	input [3:0]B,
	input C_in,
	output [3:0]F,
	output Gm,
	output Pm,
	output C_out
);
	wire [3:0] G;
	wire [3:0] P;
	wire [4:1] C;
 Add1 u1
 (	.a(A[0]),
	.b(B[0]),
	.C_in(C_in),
	.f(F[0]),
	.g(G[0]),
	.p(P[0])
 );
  Add1 u2
 (	.a(A[1]),
	.b(B[1]),
	.C_in(C[1]),
	.f(F[1]),
	.g(G[1]),
	.p(P[1])
 );
   Add1 u3
 (	.a(A[2]),
	.b(B[2]),
	.C_in(C[2]),
	.f(F[2]),
	.g(G[2]),
	.p(P[2])
 );
   Add1 u4
 (	.a(A[3]),
	.b(B[3]),
	.C_in(C[3]),
	.f(F[3]),
	.g(G[3]),
	.p(P[3])
 );
 CLA_4 uut
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
