module CLKDebouncer(
  input logic A_noisy, CLK50M,
  output logic debouncedCLK
);

  
  debouncer db(.A_noisy(A_noisy),	// noisy clock input to debouncer
					 .CLK50M(CLK50M),		// Actually taking the 50 Megahurtz (helps with button push)
					 .A(debouncedCLK)	// output of debouncer is debounced clock
	);
	
endmodule 