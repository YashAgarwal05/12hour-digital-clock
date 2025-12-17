module main_module(
    input clk,reset,
    output [7:0] digit,
    output [7:0] seg1,
    output [7:0] seg2
    );
    reg [7:0] ss;
    reg [7:0] mm;
    reg [7:0] hh;
    wire my_clk;
    Clock_Divider CD1(clk,27'd49999,my_clk);
    SevenSegmentController SSC1(clk,reset,{mm,ss},seg1,digit[3:0]);
    SevenSegmentController SSC2(clk,reset,{4'b0000,hh},seg2,digit[7:4]);
always @(posedge my_clk) begin
        if (reset) begin
            hh <= 8'b0001_0010;
            mm <= 8'b0000_0000;
            ss <= 8'b0000_0000;
            
        end else begin
           
                if(ss[3:0]==4'b1001)begin
                    ss[3:0]<=4'b0000;
         		if(ss[7:4]==4'd5)begin
                    ss[7:4]<=4'b0000;
             		if(mm [3:0]==4'd9)begin
                        mm[3:0]<=4'b0000;
                 		if(mm[7:4]==4'd5)begin
                            mm[7:4]<=4'b0000;
                           if (hh == 8'b0001_0010) begin // If hh == 12
                            hh <= 8'b0000_0001; // Reset to 01
                             // Toggle AM/PM
                        end 
                        else if (hh == 8'b0000_1001) begin // If hh == 09
                            hh <= 8'b0001_0000; // Set to 10
                        end 
                        else if (hh == 8'b0001_0000) begin // If hh == 10
                            hh <= 8'b0001_0001; // Set to 11
                            
                        end 
                        else if (hh == 8'b0001_0001) begin // If hh == 11
                            hh <= 8'b0001_0010; // Set to 12
                            
                        end 
                        else begin
                            hh[3:0] <= hh[3:0] + 4'd1; // Normal increment
                        end
                	 end
             else begin
                 mm[7:4]<=mm[7:4]+4'd1;
             end
         end else begin
             mm[3:0]<=mm[3:0]+4'd1;
         end
        
       end else begin
           ss[7:4]<=ss[7:4]+4'd1;
     end
     end else begin
         ss[3:0]<=ss[3:0]+4'd1;
    end
            end
     end
endmodule