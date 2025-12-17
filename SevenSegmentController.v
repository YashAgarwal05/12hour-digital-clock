module SevenSegmentController(
    input clk,rst,
    input [15:0] bcd_input,
    output [7:0] seg,
    output [3:0] digits
    );
    wire clk_1khz;
    wire [3:0] actual_4bits;
    wire [1:0] DigitEnable;
    Clock_Divider CD1(clk,27'd49999,clk_1khz);
    Digit_Refresher DR1(clk_1khz,rst,DigitEnable);
    mux16to4 MX1(bcd_input,DigitEnable,actual_4bits);
    SevenDecoder SD1(actual_4bits,seg);
    assign digits[0] = ~((~DigitEnable[1])&(~DigitEnable[0]));
    assign digits[1] = ~((~DigitEnable[1])&DigitEnable[0]);
    assign digits[2] = ~(DigitEnable[1]&(~DigitEnable[0]));
    assign digits[3] = ~(DigitEnable[1]&DigitEnable[0]);
endmodule
module mux16to4(
    input [15:0] in,
    input [1:0] sel,
    output reg [3:0] out
    );
    always @(*) begin
        case(sel)
            2'b00: out = in[3:0];
            2'b01: out = in[7:4];
            2'b10: out = in[11:8];
            2'b11: out = in[15:12];
        endcase
    end
endmodule