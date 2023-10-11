module seven_seg_change(
	input logic [3:0] A,
	output logic [6:0] S
);

	logic [3:0] F;
	
	// assigning actual binary bits
	assign F[0] = (~A[3] & A[2] & ~A[1] & A[0]);		//S5
	assign F[1] = (~A[3] & A[2] & A[1] & ~A[0]);		//S6
	assign F[2] = (~A[3] & A[2] & A[1] & A[0]);		//S7
	assign F[3] = (A[3] & ~A[2] & ~A[1] & ~A[0]);	//S8
	
	
	// implementing the assigned bits through the 7-seg logic from lab
	assign S[0] = ~(F[0] | F[2] | F[3]);// SA
	assign S[1] = ~(F[0] | F[1] | F[2] | F[3]);// SB
	assign S[2] = ~(F[0] | F[1] | F[3]);// SC
	assign S[3] = ~(F[0] | F[2] | F[3]);// SD
	assign S[4] = ~(F[0] | F[2]);// SE
	assign S[5] = ~(F[0]);// SF
	assign S[6] = ~(F[2] | F[3]);// SG
	
endmodule