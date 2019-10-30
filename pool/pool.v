/*
* FIRST TRIAL TO IMPLEMENT AVERAGE POOLING MODULE
* 8x8 AVERAGE POOLING WITH STRIDE = 1 
* CREATED ON 7th OCTOBER
*/

module pool (
	input pool_en ,
	output [15:0]  pool_out,
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
	reg [15:0] c,t1,t2,t3,t4 ; 
	always @(*) begin
		t1  = in0+in1+in2+in3+in4+in5+in6+in7+in8+in9+in10+in11+in12+in13+in14+in15;
		t2  = in16+in17+in18+in19+in20+in21+in22+in23+in24+in25+in26+in27+in28+in29+in30+in31;
		t3  = in32+in33+in34+in35+in36+in37+in38+in39+in40+in41+in42+in43+in44+in45+in46+in47;
		t4  = in48+in49+in50+in51+in52+in53+in54+in55+in56+in57+in58+in59+in60+in61+in62+in63;
		c =  t1+t2+t3+t4  ;
	       	//c = in0+(in1+(in2+(in3+(in4+(in5+(in6+(in7+(in8+(in9+(in10+(in11+(in12+(in13+(in14+(in15+(in16+(in17+(in18+(in19+(in20+(in21+(in22+(in23+(in24+(in25+(in26+(in27+(in28+(in29+(in30+(in31+(in32+(in33+(in34+(in35+(in36+(in37+(in38+(in39+(in40+(in41+(in42+(in43+(in44+(in45+(in46+(in47+(in48+(in49+(in50+(in51+(in52+(in53+(in54+(in55+(in56+(in57+(in58+(in59+(in60+(in61+(in62+(in63))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); //cascade
	end
	assign pool_out = c >> 6 ;
endmodule 
