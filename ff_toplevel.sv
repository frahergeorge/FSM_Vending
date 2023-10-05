module ff_toplevel(
	input logic A_noisy, CLK50M, D,
	output logic Q, nQ
);

	logic debounced_CLK;
	
	debouncer db(.A_noisy(A_noisy),	// noisy clock input to debouncer
					 .CLK50M(CLK50M),		// Actually taking the 50 Megahurtz (helps with button push)
					 .A(debounced_CLK)	// output of debouncer is debounced clock
	);
	
	d_ff dflipflop(.CLK(debounced_CLK), .D(D), .Q(Q), .nQ(nQ));
	
endmodule
