module enc42(
input logic [3:0] X, //taking in 4 bits to encode into a 2 bit output 
output logic [1:0] Z //a two bit value that is encoded from X 
);

logic A,B,C,D; //variables in which switches are assigned 


assign A = X[0]; //00
assign B = X[1]; //01
assign C = X[2]; //10
assign D = X[3]; //11

assign Z[1] = (C | D); //Most significant bit logic 
assign Z[0] = (B | D); //Least significant bit logic 


endmodule




