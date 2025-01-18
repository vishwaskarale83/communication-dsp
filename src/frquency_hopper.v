module frequency_hopper (
    input clk,
    input reset,
    input [15:0] input_signal,
    output reg [15:0] output_signal
);

reg [15:0] hop_frequency; ]

always @(posedge clk or posedge reset) begin
    if (reset) begin
        output_signal <= 0;
        hop_frequency <= 0; 
    end else begin
        output_signal <= input_signal ^ hop_frequency; 
    end
end

endmodule
