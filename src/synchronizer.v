module synchronizer (
    input clk,
    input reset,
    input [15:0] input_signal,
    output reg [15:0] synchronized_signal
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        synchronized_signal <= 0;
    end else begin
        synchronized_signal <= input_signal; 
    end
end

endmodule
