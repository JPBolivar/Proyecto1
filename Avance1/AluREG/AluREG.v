//************************************************************************************************
//  No tengo ni put* idea de lo que estoy haciendo :)  		 * Y AUN ASÍ, VA A FUNCIONAR! *
//************************************************************************************************

module AluREG (
   		  //Clock and reset
		      cp2,
		      cp2en,
		      ireset,
			  
			  // ALU
           idc_add,
           idc_adc,
           idc_adiw,
           idc_sub,
           idc_subi,
           idc_sbc,
           idc_sbci,
           idc_sbiw,
           adiw_st,
           sbiw_st,
           idc_and,
           idc_andi,
           idc_or,
           idc_ori,
           idc_eor,
           idc_com,
           idc_neg,
           idc_inc,
           idc_dec,
           idc_cp,
           idc_cpc,
           idc_cpi,
           idc_cpse,
           idc_lsr,
           idc_ror,
           idc_asr,
           idc_swap,
			  
			  mc,
			  mz,
	
  
			  alu_data_out,
			  sreg_out
		);

   		  //Clock and reset
   		  input 		      cp2;
   		  input 		      cp2en;
   		  input 		      ireset;
			  
			  // ALU
			  input	         idc_add;
			  input	         idc_adc;
			  input	         idc_adiw;
			  input	         idc_sub;
			  input	         idc_subi;
			  input	         idc_sbc;
			  input	         idc_sbci;
			  input	         idc_sbiw;
			  input	         adiw_st;
			  input	         sbiw_st;
			  input	         idc_and;
			  input	         idc_andi;
			  input	         idc_or;
 			  input	         idc_ori;
			  input	         idc_eor;
			  input	         idc_com;
			  input	         idc_neg;
			  input	         idc_inc;
			  input	         idc_dec;
			  input	         idc_cp;
			  input	         idc_cpc;
			  input	         idc_cpi;
			  input	         idc_cpse;
			  input	         idc_lsr;
			  input	         idc_ror;
			  input	         idc_asr;
			  input	         idc_swap;
			  
			  input				mc;
			  input				mz;
	
   
			  
			  output wire [7:0]     alu_data_out;
			  

		

	parameter		use_rst     = 1;
   parameter		pc22b       = 0;
   parameter		eind_width  = 1;
   parameter		rampz_width = 1;

	
	
	
	
	
	output wire [7:0]             sreg_out; // >> linea 84
	wire [7:0]				  sreg_fl_in;
	
	wire                   alu_c_flag_out;
   wire                   alu_z_flag_out;
   wire                   alu_n_flag_out;
   wire                   alu_v_flag_out;
   wire                   alu_s_flag_out;
   wire                   alu_h_flag_out;
	/*
	
	wire [7:0]             dbusin_int;
   
   // SIGNALS FOR INSTRUCTION AND STATES
   
   
   wire [7:0]             reg_rd_in;
   wire [7:0]             reg_rd_out;
   wire [7:0]             reg_rr_out;
   
   wire [4:0]             reg_rd_adr;
   wire [4:0]             reg_rr_adr;
   
   wire [15:0]            reg_h_out;
   wire [15:0]            reg_z_out;
   
   wire [2:0]             reg_h_adr;
   
   wire                   reg_rd_wr;
   wire                   post_inc;
   wire                   pre_dec;
   wire                   reg_h_wr;
   
   wire [7:0]             sreg_fl_in;
   wire [7:0]             sreg_out;
   wire [7:0]             sreg_fl_wr_en;
   wire [7:0]             spl_out;
   wire [7:0]             sph_out;
   wire [7:0]             rampz_out;
   
   wire                   sp_ndown_up;
   wire                   sp_en;
   
   wire [2:0]             bit_num_r_io;
   wire [2:0]             branch;
   
   wire [7:0]             bitpr_io_out;
   wire [7:0]             bit_pr_sreg_out;
   wire [7:0]             bld_op_out;
   
   wire                   bit_test_op_out;
   
   wire                   alu_c_flag_out;
   wire                   alu_z_flag_out;
   wire                   alu_n_flag_out;
   wire                   alu_v_flag_out;
   wire                   alu_s_flag_out;
   wire                   alu_h_flag_out;
   
   // Extended instructions 
   wire                   w_op;
   wire [7:0]             reg_rd_hb_in;
   wire [7:0]             reg_rr_hb_out;
   
   // Multiplier i/f
   wire                   fmul;		// FMUL/FMULS/FMULSU   									 
   wire                   muls;		// MULS/FMULS           									 
   wire                   mulsu;		// MULSU/FMULSU         									 
   wire [15:0]            mr_out;
   wire                   mc_out;		// C flag           									 
   wire                   mz_out;		// Z flag            									 
   
   // Devices with 22 bit PC
   wire [7:0]             eind_out;
	
	
	*/
	
	
	
	
	
	
	
	
	reg_file #(	.use_rst        (use_rst)	) 
   
	GPRF_Inst(	.cp2           (cp2), 
					.cp2en         (cp2en), 
					.ireset        (ireset), 
					.reg_rd_in     (reg_rd_in), 
					.reg_rd_out    (reg_rd_out), 
					.reg_rd_adr    (reg_rd_adr), 
					.reg_rr_out    (reg_rr_out), 
					.reg_rr_adr    (reg_rr_adr), 
					.reg_rd_wr     (reg_rd_wr), 
					.post_inc      (post_inc), 
					.pre_dec       (pre_dec), 
					.reg_h_wr      (reg_h_wr), 
					.reg_h_out     (reg_h_out), 
					.reg_h_adr     (reg_h_adr), 
					.reg_z_out     (reg_z_out), 
					.w_op          (w_op), 
					.reg_rd_hb_in  (reg_rd_hb_in), 
					.reg_rr_hb_out (reg_rr_hb_out), 
					.spm_out       (spm_out)			);
	
	
			 
	io_reg_file #(		.pc22b       (pc22b), 
							.eind_width  (eind_width), 
							.rampz_width (rampz_width)		) 
   
	IORegs_Inst(	.cp2           (cp2), 
						.cp2en         (cp2en), 
						.ireset        (ireset), 
						.adr           (adr), 
						.iowe          (iowe), 
						.dbusout       (dbusout), 

						.sreg_fl_in    ({alu_c_flag_out, alu_z_flag_out, alu_n_flag_out, alu_v_flag_out, alu_s_flag_out, alu_h_flag_out, mc, mz}),//(sreg_fl_in), 
						.sreg_out      (sreg_out), 
						.sreg_fl_wr_en (sreg_fl_wr_en), 
						.spl_out       (spl_out), 
						.sph_out       (sph_out), 
						.sp_ndown_up   (sp_ndown_up), 
						.sp_en         (sp_en), 
						.rampz_out     (rampz_out), 
						.eind_out      (eind_out)			);
			 
			 
			 
			 
	alu_avr 
		ALU_Inst(	.alu_data_r_in  (reg_rr_out), 
						.alu_data_d_in  (reg_rd_out), 
						.alu_c_flag_in  (sreg_out[0]), 
						.alu_z_flag_in  (sreg_out[1]), 
						.idc_add        (idc_add), 
						.idc_adc        (idc_adc), 
						.idc_adiw       (idc_adiw), 
						.idc_sub        (idc_sub), 
						.idc_subi       (idc_subi), 
						.idc_sbc        (idc_sbc), 
						.idc_sbci       (idc_sbci), 
						.idc_sbiw       (idc_sbiw), 
						.adiw_st        (adiw_st), 
						.sbiw_st        (sbiw_st), 
						.idc_and        (idc_and), 
						.idc_andi       (idc_andi), 
						.idc_or         (idc_or), 
						.idc_ori        (idc_ori), 
						.idc_eor        (idc_eor), 
						.idc_com        (idc_com), 
						.idc_neg        (idc_neg), 
						.idc_inc        (idc_inc), 
						.idc_dec        (idc_dec), 
						.idc_cp         (idc_cp), 
						.idc_cpc        (idc_cpc), 
						.idc_cpi        (idc_cpi), 
						.idc_cpse       (idc_cpse), 
						.idc_lsr        (idc_lsr), 
						.idc_ror        (idc_ror), 
						.idc_asr        (idc_asr), 
						.idc_swap       (idc_swap), 
						.alu_data_out   (alu_data_out), 
						.alu_c_flag_out (alu_c_flag_in), 
						.alu_z_flag_out (alu_z_flag_in), 
						.alu_n_flag_out (alu_n_flag_in), 
						.alu_v_flag_out (alu_v_flag_in), 
						.alu_s_flag_out (alu_s_flag_in), 
						.alu_h_flag_out (alu_h_flag_in)		);
						
/*	always
	begin
	
		sreg_fl_in <= {alu_c_flag_out, alu_z_flag_out, alu_n_flag_out, alu_v_flag_out, alu_s_flag_out, alu_h_flag_out, mc, mz};
		
	end */
endmodule // AluREG
