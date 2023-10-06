module nextStateLogic(
	input logic [3:0] X,
	output logic [3:0] Z		// next state outputs
);

logic [1:0] EO;				// encoded outputs/not a zero
logic [2:0] S;					// current state bit logic

assign A = X[0]; //00
assign B = X[1]; //01
assign C = X[2]; //10
assign D = X[3]; //11

enc42 encoder(.X({D, C, B, A}),		// encoder inputs
				  .Z(EO)		// encoded outputs
);

// pretend S2 is current state output 2
// pretend S1 is current state output 1
// pretend S0 is current state output 0
// EO[1] = Z1 (from encoder)
// EO[0] = Z0 (from encoder)
assign Z[0] = (~S0 | ~EO[1] | EO[0]) & (~S2 | S0 | ~EO[0]) & (~S2 | S0 | EO[1]) & (S2 | ~EO[1] | EO[0]);
assign Z[1] = (~S1 | EO[1] | ~EO[0]) & (S2 | EO[1] | ~EO[0]) & (~S2 | S1 | ~S0 | ~E[1]) & (~S2 | S1 | ~EO[1] | ~EO[0]) & (~S2 | S1 | EO[1] | EO[0]) & (~S2 | ~S1 | S0 | ~EO[1] | EO[0]);
assign Z[2] = (~S2 | EO[1] | EO[0]) & (S0 | EO[1] | EO[1]) & (~S2 | S1 | EO[1]) & (S1 | EO[1] | EO[0]) & (~S2 | S1 | S0 | EO[0]) & (S2 | ~S1 | ~S0 | ~EO[1]) & (S2 | ~S1 | ~S0 | ~EO[0]);
assign Z[3] = S2 | ~S1 | ~S0 | EO[1] | EO[0];

endmodule