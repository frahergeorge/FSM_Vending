module FSM_Test
(
  input logic [3:0] sw, //input (switches) logic of the coins 
  input logic A_noisy, //noisy clock
  input logic R_noisy, //noisy rest
  input logic CLK50M, //clock of the board 
  
  output logic item, hChange, fChange,
  output logic [3:0] led,
  output logic [6:0] hex1,
  output logic [6:0] hex2
);

  logic [1:0] Z; //encoder values 
  logic [3:0] S; //state bit logic 
  logic [3:0] mem; //bits that are going out to memory 
  logic debouncedCLK;
  logic reset;
  
  assign led = S;
  
debouncer dbCLK(.A_noisy(A_noisy),.CLK50M(CLK50M),.A(debouncedCLK)); //running the noisy clock input through the debouncer, making a stable input "debouncedCLK"

debouncer dbRES(.A_noisy(R_noisy),.CLK50M(CLK50M),.A(reset)); //running the noisy reset input through the debouncer, making a stable input "reset"

enc42 encode(.X(sw),.Z(Z));

nextStateLogic next(.EO(Z),.S(S),.Z(mem));

D_FF_neg reg0(.D(mem[0]),.RSTb(reset),.CLKb(debouncedCLK),.Q(S[0])); //Calling the four D flip flops that represent bit flips in binary 
D_FF_neg reg1(.D(mem[1]),.RSTb(reset),.CLKb(debouncedCLK),.Q(S[1])); 
D_FF_neg reg2(.D(mem[2]),.RSTb(reset),.CLKb(debouncedCLK),.Q(S[2])); 
D_FF_neg reg3(.D(mem[3]),.RSTb(reset),.CLKb(debouncedCLK),.Q(S[3])); 

//seven_seg stateOutput(.A(S), .S(hex1));
outputLogic OL(.S(S), .hexState(hex1), .item(item), .hChange(hChange), .qChange(fChange));

seven_seg_change change(.A(S), .S(hex2));

endmodule
