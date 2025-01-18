module satellite_dsp_system(
    input clk,
    input reset,
    input [1:0] data_in,         // Input data for modulation
    input signed [15:0] rx_signal, // Received signal
    output [31:0] tx_signal,      // Transmitted signal after processing
    output signed [15:0] processed_signal // Output after equalization
);

    wire signed [15:0] i_signal, q_signal;
    wire [1:0] encoded_signal;
    wire signed [15:0] equalized_signal;
    wire signed [15:0] channel_estimate;
    wire [15:0] synchronized_signal;
    wire decoded_signal;

    // QPSK Modulation
    qpsk_modulator modulator (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .i_out(i_signal), // In-phase component
        .q_out(q_signal)  // Quadrature component
    );

    // Convolutional Encoding
    convolutional_encoder encoder (
        .clk(clk),
        .reset(reset),
        .data_in(data_in[0]), // Example: use only one bit for encoding
        .encoded_out(encoded_signal)
    );

    // Synchronization
    synchronizer sync (
        .clk(clk),
        .reset(reset),
        .input_signal(rx_signal),
        .synchronized_signal(synchronized_signal)
    );

    // Adaptive Equalization
    adaptive_equalizer equalizer (
        .clk(clk),
        .reset(reset),
        .received_signal(synchronized_signal),
        .equalized_signal(equalized_signal)
    );

    // Channel Estimation
    channel_estimator estimator (
        .clk(clk),
        .reset(reset),
        .received_signal(synchronized_signal),
        .estimated_channel(channel_estimate)
    );

    // Viterbi Decoding
    viterbi_decoder decoder (
        .clk(clk),
        .reset(reset),
        .received_data(encoded_signal),
        .decoded_data(decoded_signal)
    );

    // Output the combined signal (modulated and equalized)
    assign tx_signal = {i_signal, q_signal}; // Combine I and Q for transmission
    assign processed_signal = equalized_signal; // Output the processed signal

endmodule
