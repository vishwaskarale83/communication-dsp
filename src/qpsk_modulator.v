module qpsk_modulator (
    input clk,
    input reset,
    input [1:0] data_in, // 2 bits input
    output reg signed [15:0] i_out,     // In-phase output
    output reg signed [15:0] q_out      // Quadrature output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        i_out <= 0;
        q_out <= 0;
    end else begin
        case (data_in)
            2'b00: begin i_out <= 32767; q_out <= 0; end   // 0 degrees
            2'b01: begin i_out <= 0; q_out <= 32767; end   // 90 degrees
            2'b10: begin i_out <= -32768; q_out <= 0; end  // 180 degrees
            2'b11: begin i_out <= 0; q_out <= -32768; end  // 270 degrees
        endcase
    end
end

endmodule
