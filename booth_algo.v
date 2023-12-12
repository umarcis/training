////////////////////////////////////////////////////////////////////////////////
//
// Filename
// booth_algo.v
// Author
// Muhammad Umar
// Creation Date : 12/07/2023
//
// No portions of this material may be reproduced in any form without
// the written permission of CoMira Solutions Inc.
//
// All information contained in this document is CoMira Solutions
// private, proprietary and trade secret.
//
// Description
// ===========
// 5. Write a Verilog module which multiplies two 8-bit integers using Booth Multiplication
//Algorithm.
//
//
// ///////////////////////////////////////////////////////////////////////////////



module booth_algo(result, inp_a, inp_b);
  output reg signed [15:0] result;
  input signed [7:0] inp_a, inp_b;

  reg [1:0] temp;
  integer i;
  reg q_1;
  reg [7:0] inp_b1;

  always @(inp_a,inp_b)
  begin
    result = 16'd0;
    q_1 = 1'b0;
    inp_b1 = -inp_b;
    
    for (i=0; i<8; i=i+1)
    begin
      temp = { inp_a[i], q_1 };
      case(temp)
        2'd2 : result[15:8] = result[15:8] + inp_b1;
        2'd1 : result[15:8] = result[15:8] + inp_b;
      endcase
      result = result >> 1;
      result[15] = result[14];
      q_1=inp_a[i];
      
    end
  end
  
endmodule

















// module Booth_Multiplier(result, inp_a, inp_b);
//   output reg signed [7:0] result;
//   input signed [3:0] inp_a, inp_b;

//   reg [1:0] temp;
//   integer i;
//   reg q_1;
//   reg [3:0] inp_b1;

//   always @(inp_a,inp_b)
//   begin
//     result = 8'd0;
//     q_1 = 1'b0;
//     inp_b1 = -inp_b;
    
//     for (i=0; i<4; i=i+1)
//     begin
//       temp = { inp_a[i], q_1 };
//       case(temp)
//         2'd2 : result[7:4] = result[7:4] + inp_b1;
//         2'd1 : result[7:4] = result[7:4] + inp_b;
//       endcase
//       result = result >> 1;
//       result[7] = result[6];
//       q_1=inp_a[i];
      
//     end
//   end
  
// endmodule
