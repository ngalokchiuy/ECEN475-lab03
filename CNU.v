`timescale 1ns/1ps

module CNU(SO, err, Cs);
	input [5:0] Cs; // also done backward
	output [2:0] SO;
	output err; // error, hi if SO neq 0 (use or SO)
	
	// Cs[5] = C1
	// Cs[4] = C2
	// 1 1 0 1 0 0 
	// 0 1 1 0 1 0
	// 1 1 1 0 0 1

	// not accounting for zero indexing or MSB convention of tb, just for
	// note
	// S1 = mod2( C1 + C2 + C4)
	// S2 = mod2( C2 + C3 + C5)
	// S3 = mod2( C1 + C2 + C3 + C6)
	
	// top row
	assign SO[2] = Cs[5] ^ Cs[4] ^ Cs[2];
	// middle row
	assign SO[1] = Cs[4] ^ Cs[3] ^ Cs[1];
	// bottom row
	assign SO[0] = Cs[5] ^ Cs[4] ^ Cs[3] ^ Cs[0];
	
	assign err = |SO; // checks if nonzero
	endmodule
