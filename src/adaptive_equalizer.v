module adaptive_equalizer (
    input clk,
    input reset,
    input signed [15:0] received_signal,
    output reg signed [15:0] equalized_signal
);

reg signed [15:0] coefficients [0:3];

always @(posedge clk or posedge reset) begin
    if (reset) begin
        equalized_signal <= 0;
    end else begin
        equalized_signal <= received_signal; 
    end
end

endmodule
