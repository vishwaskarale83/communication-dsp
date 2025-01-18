module viterbi_decoder (
    input clk,
    input reset,
    input [1:0] received_data,
    output reg decoded_data
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        decoded_data <= 0;
    end else begin
        decoded_data <= received_data[0]; 
    end
end

endmodule
