module outputLogic(
	input logic [3:0] S,
	output logic item, hChange, qChange,
	output logic [6:0] hexState,
	output logic [6:0] hexChange
);

seven_seg stateBit(.A(S), .S(hexState));

//seven_seg farthingChange(.A(), .S(hexChange));


// if greater than S4, dispense tomato
assign item = (S > 4'b0100) ? 1 : 0; 

// only at state 7 and 8
assign hChange = (~S[3] & S[2] & S[1] & S[0]) | (S[3] & ~S[2] & ~S[1] & ~S[0]);

// only at state 6 and 8
assign qChange = (~S[3] & S[2] & S[1] & ~S[0]) | (S[3] & ~S[2] & ~S[1] & ~S[0]);

endmodule