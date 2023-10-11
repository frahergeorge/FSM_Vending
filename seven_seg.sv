module seven_seg(
	input logic [3:0] A,
	output logic [6:0] S
);

	logic [8:0] F;
	
	// assigning actual binary bits
	assign F[0] = (~A[3] & ~A[2] & ~A[1] & ~A[0]);		// 0 is alternating
	assign F[1] = (~A[3] & ~A[2] & ~A[1] & A[0]);		// 1 is every 2
	assign F[2] = (~A[3] & ~A[2] & A[1] & ~A[0]);		// 2 is every 4
	assign F[3] = (~A[3] & ~A[2] & A[1] & A[0]);			// 3 is everyone except last
	assign F[4] = (~A[3] & A[2] & ~A[1] & ~A[0]);
	assign F[5] = (~A[3] & A[2] & ~A[1] & A[0]);
	assign F[6] = (~A[3] & A[2] & A[1] & ~A[0]);
	assign F[7] = (~A[3] & A[2] & A[1] & A[0]);
	assign F[8] = (A[3] & ~A[2] & ~A[1] & ~A[0]);
	
	// implementing the assigned bits through the 7-seg logic from lab
	assign S[0] = ~(F[0] | F[2] | F[3] | F[5] | F[6] | F[7] | F[8]);			// SA
	assign S[1] = ~(F[0] | F[1] | F[2] | F[3] | F[4] | F[7] | F[8]);			// SB
	assign S[2] = ~(F[0] | F[1] | F[3] | F[4] | F[5] | F[6] | F[7] | F[8]);	// SC
	assign S[3] = ~(F[0] | F[2] | F[3] | F[5] | F[6] | F[8]);					// SD
	assign S[4] = ~(F[0] | F[2] | F[6] | F[8]);										// SE
	assign S[5] = ~(F[0] | F[4] | F[5] | F[6] | F[8]);								// SF
	assign S[6] = ~(F[2] | F[3] | F[4] | F[5] | F[6] | F[8]);					// SG
	
endmodule