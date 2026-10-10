`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2026 15:46:35
// Design Name: 
// Module Name: smart_street_light
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module smart_street_lighting(
    input  day_night,
    input  vehicle,
    input  [1:0] traffic,

    output reg street_light,
    output reg traffic_alert
);

always @(*) begin

    // Default outputs
    street_light = 1'b0;
    traffic_alert = 1'b0;

    // Day time
    if (day_night == 1'b1) begin
        street_light = 1'b0;
    end

    // Night time
    else begin

        // Vehicle detected
        if (vehicle == 1'b1)
            street_light = 1'b1;

        // No vehicle
        else begin
            case (traffic)

                2'b00: street_light = 1'b0; // Low traffic
                2'b01: street_light = 1'b1; // Medium traffic
                2'b10: street_light = 1'b1; // High traffic

                default: street_light = 1'b0;

            endcase
        end

        // High traffic alert
        if (traffic == 2'b10)
            traffic_alert = 1'b1;
        else
            traffic_alert = 1'b0;

    end

end

endmodule
