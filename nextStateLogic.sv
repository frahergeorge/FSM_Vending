module nextStateLogic(
	input logic [1:0] EO,		// encoded outputs/not a zero
	input logic [3:0] S,		// current state bit logic
	output logic [3:0] Z		//Values going into D flip flops 
);


// S[2] = left most bit (MSB)
// S[1] = second left most bit
// S[0] = third left most bit
// EO[1] = Z1 (from encoder)
// EO[0] = Z0 (from encoder)
	assign Z[0] = (~S[0] & ~EO[1] & EO[0]) | (~S[2] & S[0] & ~EO[0]) | (~S[2] & S[0] & EO[1]) | (S[2] & ~EO[1] & EO[0]);
	assign Z[1] = (~S[1] & EO[1] & ~EO[0]) | (S[2] & EO[1] & ~EO[0]) | (~S[2] & S[1] & ~S[0] & ~EO[1]) | (~S[2] & S[1] & ~EO[1] & ~EO[0]) | (~S[2] & S[1] & EO[1] & EO[0]) | (~S[2] & ~S[1] & S[0] & ~EO[1] & EO[0]);
	assign Z[2] = (~S[2] & EO[1] & EO[0]) | (S[0] & EO[1] & EO[0]) | (~S[2] & S[1] & EO[1]) | (S[1] & EO[1] & EO[0]) | (~S[2] & S[1] & S[0] & EO[0]) | (S[2] & ~S[1] & ~S[0] & ~EO[1]) | (S[2] & ~S[1] & ~S[0] & ~EO[0]);	
	assign Z[3] = S[2] & ~S[1] & ~S[0] & EO[1] & EO[0];

endmodule

// This module is taking 2 inputs from the encoder that has logic to condense 4 inputs into 2
// Also taking 3 inputs from the state memory registers (4 d_ff's) and using all inputs combined
// to determine an output
