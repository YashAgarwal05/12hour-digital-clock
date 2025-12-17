module Clock_Divider(
    input clk_100Mhz,
    input [26:0] half_timeperiod,
    output reg clk_1hz
    );
    reg [26:0] counter;
    always @(posedge clk_100Mhz) begin
        if(counter == half_timeperiod) begin
            counter <= 0;
            clk_1hz <= ~clk_1hz;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule