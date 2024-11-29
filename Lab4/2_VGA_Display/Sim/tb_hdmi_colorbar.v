`timescale 1ns/1ns
module tb_hdmi_colorbar();
////
//\* Parameter and Internal Signal \//
////
//wire define
wire ddc_scl ;
wire ddc_sda ;
wire tmds_clk_p ;
wire tmds_clk_n ;
 wire [2:0] tmds_data_p ;
 wire [2:0] tmds_data_n ;

 //reg define
 reg sys_clk ;
 reg c5x ;
 reg sys_rst_n ;

 ////
 //\* Clk And Rst \//
 ////

 //sys_clk,sys_rst_n初始赋值
 initial
 begin
 sys_clk = 1'b1;
 c5x = 1'b1;
 sys_rst_n <= 1'b0;
 #200
 sys_rst_n <= 1'b1;
 end

 //sys_clk：产生时钟
 always #50 sys_clk = ~sys_clk ;
 always #10 c5x = ~c5x ;
 
wire [15:0] vga_pix  = hdmi_colorbar_inst.vga_ctrl_inst.rgb   ;
wire [7:0] b8_blue   = hdmi_colorbar_inst.hdmi_ctrl_inst.rgb_blue  ;
wire [7:0] b8_green  = hdmi_colorbar_inst.hdmi_ctrl_inst.rgb_green ;
wire [7:0] b8_red    = hdmi_colorbar_inst.hdmi_ctrl_inst.rgb_red   ;
wire [9:0] b10_blue  = hdmi_colorbar_inst.hdmi_ctrl_inst.red   ;
wire [9:0] b10_green = hdmi_colorbar_inst.hdmi_ctrl_inst.green ;
wire [9:0] b10_red   = hdmi_colorbar_inst.hdmi_ctrl_inst.blue  ;
wire [11:0] pix_x    = hdmi_colorbar_inst.vga_ctrl_inst.pix_x     ;
wire [11:0] pix_y    = hdmi_colorbar_inst.vga_ctrl_inst.pix_y     ;
wire [1:0] pix_y     = hdmi_colorbar_inst.vga_ctrl_inst.rgb_valid ;

 ////
 //\* Instantiation \//
 ////

 //------------- hdmi_colorbar_inst -------------
 hdmi_colorbar hdmi_colorbar_inst
 (
 .sys_clk (sys_clk ), //输入工作时钟,频率50MHz
 .sys_rst_n (sys_rst_n ), //输入复位信号,低电平有效
 .clk_5x (c5x ), //输入5倍工作时钟

 .ddc_scl (ddc_scl ),
 .ddc_sda (ddc_sda ),
 .tmds_clk_p (tmds_clk_p ),
 .tmds_clk_n (tmds_clk_n ), //HDMI时钟差分信号
 .tmds_data_p (tmds_data_p),
 .tmds_data_n (tmds_data_n) //HDMI图像差分信号
 );

 endmodule
