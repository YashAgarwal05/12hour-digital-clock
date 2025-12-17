module Digit_Refresher(
    input clk,rst,
    output reg [1:0] digit_sel
    );
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            digit_sel<=0;
        end
        else begin
            digit_sel<=digit_sel+1;
        end
    end
endmodule