module dffReg(
    input logic CLK50M, R_Noisy,A_Noisy,
    input logic [3:0] binary, 
    output logic [3:0] led
);


logic reset,debouncedCLK;

debouncer dbCLK(.A_noisy(A_noisy),.CLK50M(CLK50M),.A(debouncedCLK));
debouncer dbRES(.A_noisy(R_noisy),.CLK50M(CLK50M),.A(reset));

D_FF_neg reg0(.D(binary[0]),.RSTb(reset),.CLKb(debouncedCLK),.Q(led[0])); 
D_FF_neg reg1(.D(binary[1]),.RSTb(reset),.CLKb(debouncedCLK),.Q(led[1])); 
D_FF_neg reg2(.D(binary[2]),.RSTb(reset),.CLKb(debouncedCLK),.Q(led[2])); 
D_FF_neg reg3(.D(binary[3]),.RSTb(reset),.CLKb(debouncedCLK),.Q(led[3])); 


endmodule



