module convolutional_encoder (
    input clk,
    input reset,
    input data_in,
    output reg [1:0] encoded_out // 2-bit encoded output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        encoded_out <= 0;
    end else begin
        encoded_out <= {data_in, data_in}; 
    end
end

endmodule
