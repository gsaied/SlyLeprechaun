/* verilator lint_off COMBDLY */
/*
* FIRST TRIAL TO IMPLEMENT AVERAGE POOLING MODULE
* 8x8 AVERAGE POOLING WITH STRIDE = 1 
* CREATED ON 7th OCTOBER
*/
module new_pool(
	output reg [15:0] pool_out , 
	input clk ,
	input [15:0] in0,
	input [15:0] in1,
	input [15:0] in2,
	input [15:0] in3,
	input [15:0] in4,
	input [15:0] in5,
	input [15:0] in6,
	input [15:0] in7,
	input [15:0] in8,
	input [15:0] in9,
	input [15:0] in10,
	input [15:0] in11,
	input [15:0] in12,
	input [15:0] in13,
	input [15:0] in14,
	input [15:0] in15,
	input [15:0] in16,
	input [15:0] in17,
	input [15:0] in18,
	input [15:0] in19,
	input [15:0] in20,
	input [15:0] in21,
	input [15:0] in22,
	input [15:0] in23,
	input [15:0] in24,
	input [15:0] in25,
	input [15:0] in26,
	input [15:0] in27,
	input [15:0] in28,
	input [15:0] in29,
	input [15:0] in30,
	input [15:0] in31,
	input [15:0] in32,
	input [15:0] in33,
	input [15:0] in34,
	input [15:0] in35,
	input [15:0] in36,
	input [15:0] in37,
	input [15:0] in38,
	input [15:0] in39,
	input [15:0] in40,
	input [15:0] in41,
	input [15:0] in42,
	input [15:0] in43,
	input [15:0] in44,
	input [15:0] in45,
	input [15:0] in46,
	input [15:0] in47,
	input [15:0] in48,
	input [15:0] in49,
	input [15:0] in50,
	input [15:0] in51,
	input [15:0] in52,
	input [15:0] in53,
	input [15:0] in54,
	input [15:0] in55,
	input [15:0] in56,
	input [15:0] in57,
	input [15:0] in58,
	input [15:0] in59,
	input [15:0] in60,
	input [15:0] in61,
	input [15:0] in62,
	input [15:0] in63 
);
reg [15:0] u0;
reg [15:0] u2;
reg [15:0] u4;
reg [15:0] u6;
reg [15:0] u8;
reg [15:0] u10;
reg [15:0] u12;
reg [15:0] u14;
reg [15:0] u16;
reg [15:0] u18;
reg [15:0] u20;
reg [15:0] u22;
reg [15:0] u24;
reg [15:0] u26;
reg [15:0] u28;
reg [15:0] u30;
reg [15:0] u32;
reg [15:0] u34;
reg [15:0] u36;
reg [15:0] u38;
reg [15:0] u40;
reg [15:0] u42;
reg [15:0] u44;
reg [15:0] u46;
reg [15:0] u48;
reg [15:0] u50;
reg [15:0] u52;
reg [15:0] u54;
reg [15:0] u56;
reg [15:0] u58;
reg [15:0] u60;
reg [15:0] u62;

////////////////
//abstraction gded
//level gedded
//
reg [15:0] z0;
reg [15:0] z4;
reg [15:0] z8;
reg [15:0] z12;
reg [15:0] z16;
reg [15:0] z20;
reg [15:0] z24;
reg [15:0] z28;
reg [15:0] z32;
reg [15:0] z36;
reg [15:0] z40;
reg [15:0] z44;
reg [15:0] z48;
reg [15:0] z52;
reg [15:0] z56;
reg [15:0] z60;


always @(posedge clk ) begin
u0<=(in0+in1);
u2<=(in2+in3);
u4<=(in4+in5);
u6<=(in6+in7);
u8<=(in8+in9);
u10<=(in10+in11);
u12<=(in12+in13);
u14<=(in14+in15);
u16<=(in16+in17);
u18<=(in18+in19);
u20<=(in20+in21);
u22<=(in22+in23);
u24<=(in24+in25);
u26<=(in26+in27);
u28<=(in28+in29);
u30<=(in30+in31);
u32<=(in32+in33);
u34<=(in34+in35);
u36<=(in36+in37);
u38<=(in38+in39);
u40<=(in40+in41);
u42<=(in42+in43);
u44<=(in44+in45);
u46<=(in46+in47);
u48<=(in48+in49);
u50<=(in50+in51);
u52<=(in52+in53);
u54<=(in54+in55);
u56<=(in56+in57);
u58<=(in58+in59);
u60<=(in60+in61);
u62<=(in62+in63);

end
reg [15:0] hazem0;
reg [15:0] hazem8;
reg [15:0] hazem16;
reg [15:0] hazem24;
reg [15:0] hazem32;
reg [15:0] hazem40;
reg [15:0] hazem48;
reg [15:0] hazem56;
reg [15:0] kamal0;
reg [15:0] kamal16;
reg [15:0] kamal32;
reg [15:0] kamal48;
reg [15:0] pop1 ; 
reg [15:0] pop2 ; 

always @(posedge clk) begin
z0<=(u0+u2);
z4<=(u4+u6);
z8<=(u8+u10);
z12<=(u12+u14);
z16<=(u16+u18);
z20<=(u20+u22);
z24<=(u24+u26);
z28<=(u28+u30);
z32<=(u32+u34);
z36<=(u36+u38);
z40<=(u40+u42);
z44<=(u44+u46);
z48<=(u48+u50);
z52<=(u52+u54);
z56<=(u56+u58);
z60<=(u60+u62);
hazem0<=(z0+z4);
hazem8<=(z8+z12);
hazem16<=(z16+z20);
hazem24<=(z24+z28);
hazem32<=(z32+z36);
hazem40<=(z40+z44);
hazem48<=(z48+z52);
hazem56<=(z56+z60);
kamal0<=(hazem0+hazem8);
kamal16<=(hazem16+hazem24);
kamal32<=(hazem32+hazem40);
kamal48<=(hazem48+hazem56);
pop1<=(kamal0 + kamal16) ; 
pop2<=(kamal32 + kamal48) ; 


end
always @(posedge clk ) begin
	pool_out <= pop2+pop1 ; 
end
endmodule
