module dffReg(
    input logic CLK50M, //clock of the board operating at 50 Hz
	 input logic R_noisy, //Noisy button press input of Key1
	 input logic A_noisy, //Noisy button press input of Key0
    input logic [3:0] binary, //the inputs to the D-flip flops 
    output logic [3:0] led //The output lights to indicate which bits are flipped 
);


logic reset,debouncedCLK; //the debounced inputs that will be used for the d flip flops 

debouncer dbCLK(.A_noisy(A_noisy),.CLK50M(CLK50M),.A(debouncedCLK)); //running the noisy clock input through the debouncer, making a stable input "debouncedCLK"
debouncer dbRES(.A_noisy(R_noisy),.CLK50M(CLK50M),.A(reset)); //running the noisy reset input through the debouncer, making a stable input "reset"

D_FF_neg reg0(.D(binary[0]),.RSTb(reset),.CLKb(debouncedCLK),.Q(led[0])); //Calling the four D flip flops that represent bit flips in binary 
D_FF_neg reg1(.D(binary[1]),.RSTb(reset),.CLKb(debouncedCLK),.Q(led[1])); 
D_FF_neg reg2(.D(binary[2]),.RSTb(reset),.CLKb(debouncedCLK),.Q(led[2])); 
D_FF_neg reg3(.D(binary[3]),.RSTb(reset),.CLKb(debouncedCLK),.Q(led[3])); 


endmodule

