/* FIRST IMPLEMENTATION OF A CONV LAYER
* LAYER: CONV1 
* INPUT SIZE: 256*256*3
* OUTPUT SIZE: 128*128*64
* STRIDE: 2
* PAD:	1
* WINDOW: 3*3
*/

module conv1#(
parameter DSP_NO = 64 ,
parameter STRIDE = 2 ,
parameter W_IN = 256 ,
parameter H_IN = 256 ,
parameter WIDTH = 16 ,
parameter CHIN = 3 , 
parameter KERNEL_DIM = 3 ,
parameter CHOUT = 64  ,
parameter WINDOWS=CHIN*(((W_IN-1)/STRIDE)**2),
parameter CONV1_TIMER = $clog2(WINDOWS)
)       
	(
	input clk,
	input rst,
	input conv1_en,
	output reg conv1_end , 
	output reg [15:0] ofm [0:DSP_NO-1]

);
wire [WIDTH-1:0] biasing_wire [0:DSP_NO-1] ;
biasing_rom b1 (
	.bias_mem(biasing_wire)
);
////////////////////////////////////
wire [2*WIDTH-1:0] ofmw [0:DSP_NO-1];
reg  [2*WIDTH-1:0] ofmw2 [0:DSP_NO-1];
reg [4:0] counter_10 ;
reg clk_3 ;  
//reg [$clog2(WINDOWS)-1:0] conv1_timer ; 
///////////////////////////////////
//KERNELS INSTANTIATION
///////////////////////////////////
wire [WIDTH-1:0] kernels [0:DSP_NO-1] ; 
reg [WIDTH-1:0] kernel_regs [0:DSP_NO-1] ; 
reg [5-1:0] weight_rom_address ; 
//////////////////////////////////
rom_array_layer_1 u_2 (
	.address(weight_rom_address),
	.rom_out(kernels)
);
///////////////////////////////////
//this signal is very important to track
//represents a pulse to clr pin of mac to reset every 27 cycles of clk
///////////////////////////////////
reg clr_pulse ; 
///////
///////
always @(posedge clk or negedge rst) begin
	if(!rst)
		weight_rom_address<= 5'b0 ; 
	else if (clr_pulse)
		weight_rom_address<= 5'b0;// 5--> ceil(logn(HIN**2*CHIN,2))
	else begin
		weight_rom_address<= weight_rom_address+1;
	end
end
always @(posedge clk) begin
	kernel_regs<=kernels ;		
end
wire [WIDTH-1:0] img_rom_wire  ;
reg [17:0] img_rom_address ;
reg [17:0] ref_address ;
///////////////////////////////////
//GENERATION OF WINDOW ADDRESSES///
///////////////////////////////////
///////
/*
always @(posedge clk or negedge rst) begin
	if(!rst) begin
		window_counter <= 3'b0 ;
		window_pulse_1 <= 1'b0 ;
		window_pulse_2 <= 1'b0 ;
	end
	else if (window_counter == 3'b010 )  begin
		window_pulse_1 <= 1'b1 ;
		window_counter <= window_counter+1 ;
	end
	else if (window_counter == 3'b110) begin
		window_pulse_2 <= 1'b1 ;
		window_counter <= 3'b0; 
	end
	else begin
		window_pulse_1 <= 1'b0 ;
		window_pulse_2 <= 1'b0 ;
		window_counter <= window_counter+1 ;
	end
end
*/
///////////////////////////////////
reg [4:0] img_addr_counter ;
always @(posedge clk or negedge rst) begin
	if(!rst)
		img_addr_counter <= 0 ;
	else if (clr_pulse)
		img_addr_counter <= 0 ;
	else 
		img_addr_counter <= img_addr_counter+1 ;
end
always @(posedge clk or negedge rst) begin
	if(!rst) begin
		img_rom_address<=18'b0; 
		ref_address<= 18'b0 ; 
	end
	else if (clr_pulse) begin
		ref_address<= ref_address+STRIDE;//makes sense; for window has ended here, a new address should be generated
		img_rom_address<= ref_address+STRIDE ; 
	end
	else begin
		case (img_addr_counter) 
			5'd2 : img_rom_address<= ref_address+ W_IN ;
			5'd5 : img_rom_address<= ref_address+ W_IN*2 ;
			5'd8 : img_rom_address<= ref_address+ W_IN**2;
			5'd11: img_rom_address<= ref_address+ W_IN**2 + W_IN;
			5'd14: img_rom_address<= ref_address+ W_IN**2 + 2*W_IN;
			5'd17: img_rom_address<= ref_address+ 2*W_IN**2;
			5'd20 : img_rom_address<= ref_address+ 2*W_IN**2 + W_IN;
			5'd23 : img_rom_address<= ref_address+ 2*W_IN**2 + 2*W_IN;
			default: img_rom_address<= img_rom_address+1 ;
		endcase
	end
end
img_rom u_1 (
	.clk(clk),
	.address(img_rom_address),
	.img_out(img_rom_wire)
);
// counter to generate clock_divider
always @(posedge clk or negedge rst) begin
	if(!rst) begin
		counter_10<= 5'b0 ; 
		clr_pulse <= 1'b0 ;
		clk_3 <= 1'b0; 
	end
	else if (!conv1_end) begin
		if (counter_10 == KERNEL_DIM**2*CHIN ) begin //after 10 cycles the new output is good to go. New inputs to be fetched
			counter_10<= 5'b0 ; 
			clk_3 <= 1'b1 ;
			clr_pulse <= 1'b1 ;
		end
		else begin
			clr_pulse <= 1'b0 ; //remain 0 as long as MAC is active
			counter_10<= counter_10 +1 ;	
			clk_3 <= 1'b0; 
		end
	end
end
//////////////////////////////////////////
// wait for all channels to be processed
// ///////////////////////////////////////
reg [4:0] clk_sampling_counter ; 
reg clk_sampling ; 
always @(posedge clk or negedge rst) begin
	if(!rst) begin
		clk_sampling_counter <= 5'b0 ; 
		clk_sampling<= 1'b0 ;
	end
	else if (clk_sampling_counter == 28) begin
		clk_sampling<= 1'b1 ; 
		clk_sampling_counter<= 0;
	end
	else begin
		clk_sampling<= 1'b0 ;
		clk_sampling_counter<= clk_sampling_counter +1 ;
	end
end
always @(*) begin
	for (int i = 0 ; i < DSP_NO ; i++) begin
		ofmw2[i]  = ofmw[i] + {biasing_wire[i],16'b0}  ; //bias + CHECK IF THIS LOGIC IS CORRECT
	end
end
always@(posedge clk_sampling) begin
	if(!conv1_end && conv1_en) begin
		for (int i = 0 ; i< DSP_NO ; i++) begin
			if(ofmw[i][31] == 1'b1 ) 
				ofm[i] <= 16'b0 ;
			else
				ofm[i] <= ofmw2[i][23:8];
		end
	end
end
//
//////////////////////////////////
//MOVING ADDRESS TOWARDS CHANNELS AFTER COMPLETING 1 WINDOW
//////////////////////////////////
/*
always @(posedge clk_3 or negedge rst) begin
	if (!rst)
		ch_active <=2'b1;
	else if (ch_active == CHIN) 
		ch_active <= 2'b1 ; 
	else
		ch_active <= ch_active +1;
end
*/
//////////////////////////////////
genvar i ; 
generate for (i = 0 ; i < CHOUT ; i++) begin
	mac mac_i  (
		.clr(clr_pulse),
		.clk(clk),
		.rst(rst),
		.pix(img_rom_wire),
		.mul_out(ofmw[i]),
		.ker(kernel_regs[i])
	);
end
endgenerate//#FILTERS instances of macs
//////////////////////////////////
//CHECK IF THE LAYER HAS FINISHED
/////////////////////////////////

reg [$clog2(CHOUT**2)-1:0] conv1_timer ;// will be changed
always @(posedge clk_3 or negedge rst) begin//will be modified to use clk_sampling as the counting signal
	if (!rst) begin
		conv1_timer<= 0 ;
		conv1_end <= 1'b0 ; 
	end
	else if (conv1_timer == CHOUT**2-1)
		conv1_end <= 1'b1 ;//LAYER_1 HAS FINISHED
	else
		conv1_timer<= conv1_timer+1 ; 
end
endmodule
