module channel_estimator (
    input clk,
    input reset,
    input [15:0] received_signal,
    output reg [15:0] estimated_channel
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        estimated_channel <= 0;
    end else begin
        estimated_channel <= received_signal; 
    end
end

endmodule
