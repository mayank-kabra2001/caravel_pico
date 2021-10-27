// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

/* sysctrl defines a few signals that are required to be passed from
 * the management SoC to the management protect block to avoid
 * unconnected signals in the user project from reaching the managment
 * SoC as unconnected signals.  The logic analyzer handles its own
 * enables.  These signals are for the three user IRQ signals and the
 * user wishbone (affecting return data and acknowledge).
 */

`default_nettype none
module sysctrl_wb #(
    parameter BASE_ADR     = 32'h2F00_0000,
    parameter IRQ_ENA      = 8'h00,
    parameter WB_ENA       = 8'h04
) (
    input wb_clk_i,
    input wb_rst_i,

    input [31:0] wb_dat_i,
    input [31:0] wb_adr_i,
    input [3:0] wb_sel_i,
    input wb_cyc_i,
    input wb_stb_i,
    input wb_we_i,

    output [31:0] wb_dat_o,
    output wb_ack_o,
    
    output       mprj_wb_iena,
    output [2:0] user_irq_ena
);

    wire resetn;
    wire valid;
    wire ready;
    wire [3:0] iomem_we;

    assign resetn = ~wb_rst_i;
    assign valid = wb_stb_i && wb_cyc_i; 

    assign iomem_we = wb_sel_i & {4{wb_we_i}};
    assign wb_ack_o = ready;
    
    sysctrl #(
        .BASE_ADR(BASE_ADR),
        .IRQ_ENA(IRQ_ENA),
        .WB_ENA(WB_ENA)
    ) sysctrl (
        .clk(wb_clk_i),
        .resetn(resetn),
        
        .iomem_addr(wb_adr_i),
        .iomem_valid(valid),
        .iomem_wstrb(iomem_we),
        .iomem_wdata(wb_dat_i),
        .iomem_rdata(wb_dat_o),
        .iomem_ready(ready),
        
	.user_irq_ena(user_irq_ena),
	.mprj_wb_iena(mprj_wb_iena)
    );

endmodule

module sysctrl #(
    parameter BASE_ADR = 32'h2300_0000,
    parameter IRQ_ENA      = 8'h00,
    parameter WB_ENA       = 8'h04
) (
    input clk,
    input resetn,
    
    input [31:0] iomem_addr,
    input iomem_valid,
    input [3:0] iomem_wstrb,
    input [31:0] iomem_wdata,
    output reg [31:0] iomem_rdata,
    output reg iomem_ready,

    output [2:0] user_irq_ena,
    output 	 mprj_wb_iena
); 

    reg [2:0] user_irq_ena;
    reg	      mprj_wb_iena;

    wire irq_sel;
    wire wb_sel;

    assign irq_sel = (iomem_addr[7:0] == IRQ_ENA);
    assign wb_sel  = (iomem_addr[7:0] == WB_ENA);

    always @(posedge clk) begin
        if (!resetn) begin
	    mprj_wb_iena <= 0;
	    user_irq_ena <= 0;
        end else begin
            iomem_ready <= 0;
            if (iomem_valid && !iomem_ready && iomem_addr[31:8] == BASE_ADR[31:8]) begin
                iomem_ready <= 1'b 1;
                
                if (wb_sel) begin
                    iomem_rdata <= {31'd0, mprj_wb_iena};
                    if (iomem_wstrb[0]) begin
			mprj_wb_iena <= iomem_wdata[0];
		    end

                end else if (irq_sel) begin
                    iomem_rdata <= {29'd0, user_irq_ena};
                    if (iomem_wstrb[0]) begin
                        user_irq_ena <= iomem_wdata[2:0];
		    end
                end
            end
        end
    end

endmodule
`default_nettype wire
