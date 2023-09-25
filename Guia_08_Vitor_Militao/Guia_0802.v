// -------------------------
// Guia_0802 - HALF SUBTRACTOR
// -------------------------
module halfSubtractor (output diff, borrow, input a, input b);
    xor XOR1 ( diff, a, b );
    and AND1 ( borrow, ~a, b );
endmodule // halfSubtractor

// -------------------------
// Guia_0802 - FULL SUBTRACTOR
// -------------------------
module fullSubtractor ( output diff, borrow, input a, input b, input bin );
    wire diff_int;
    wire borrow_int;
    
    halfSubtractor HS1 ( diff_int, borrow_int, a, b );
    halfSubtractor HS2 ( diff, borrow, diff_int, bin );
endmodule // fullSubtractor

// -------------------------
// Guia_0802 - SUBTRACTOR UNIT
// -------------------------
module Guia_0802 (
    output [5:0] s,
    input [4:0] a,
    input [4:0] b
);
    wire [4:0] borrow;

    // Connect full subtractors
    fullSubtractor FS0 (s[0], borrow[0], a[0], b[0], 1'b0);
    fullSubtractor FS1 (s[1], borrow[1], a[1], b[1], borrow[0]);
    fullSubtractor FS2 (s[2], borrow[2], a[2], b[2], borrow[1]);
    fullSubtractor FS3 (s[3], borrow[3], a[3], b[3], borrow[2]);
    fullSubtractor FS4 (s[4], borrow[4], a[4], b[4], borrow[3]);
    fullSubtractor FS5 (s[5], s[4], 1'b0, 1'b0, borrow[4]);
endmodule // Guia_0802

module test_Guia_0802;
    // Define inputs and outputs
    reg [4:0] x, y;
    wire [5:0] s_out;
    
    // Instantiate the Guia_0802 module
    Guia_0802 UUT (
        .s(s_out),
        .a(x),
        .b(y)
    );

    // Testbench
    initial begin
        // Initialize inputs
        x = 5'b00000;
        y = 5'b00000;

        // Test case 1
        #10 x = 5'b00001; y = 5'b00000;
        #10 x = 5'b00001; y = 5'b00001;
        #10 x = 5'b00010; y = 5'b00001;
        #10 x = 5'b00100; y = 5'b00001;
        #10 x = 5'b01000; y = 5'b00001;
        #10 x = 5'b10000; y = 5'b00001;

        // Add more test cases as needed

        // End simulation
        $finish;
    end
endmodule // test_Guia_0802