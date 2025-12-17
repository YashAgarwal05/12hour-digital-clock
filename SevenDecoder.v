module SevenDecoder(
  input [3:0] in,
  output [7:0] seg
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  assign s2 = ~ in[3];
  assign s1 = ~ in[2];
  assign s0 = ~ in[1];
  assign s3 = ~ in[0];
  assign seg[0] = ((in[0] & s0 & s1 & s2) | (s3 & s0 & in[2]));
  assign seg[1] = ((in[0] & s0 & in[2]) | (s3 & in[1] & in[2]));
  assign seg[2] = (s3 & in[1] & s1);
  assign seg[3] = ((in[0] & s0 & s1 & s2) | (s3 & s0 & in[2]) | (in[0] & in[1] & in[2]));
  assign seg[4] = (in[0] | (s0 & in[2]));
  assign seg[5] = ((in[0] & s1 & s2) | (in[0] & in[1]) | (in[1] & s1));
  assign seg[6] = ((in[0] & in[1] & in[2] & s2) | (s0 & s1 & s2));
  assign seg[7] = 1;
endmodule