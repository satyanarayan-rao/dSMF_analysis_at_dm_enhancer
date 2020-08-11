pdfjam non_sig_T_T.pdf non_sig_N_N.pdf non_sig_D_D.pdf non_sig_D_N_N_D.pdf non_sig_T_N_N_T.pdf non_sig_T_D_D_T.pdf --nup 6x1 --landscape --outfile non_sig_all_bxplt.pdf
pdfjam imb_T_T.pdf imb_N_N.pdf imb_D_D.pdf imb_D_N_N_D.pdf imb_T_N_N_T.pdf imb_T_D_D_T.pdf --nup 6x1 --landscape --outfile imb_all_bxplt.pdf
pdfjam not_imb_T_T.pdf not_imb_N_N.pdf not_imb_D_D.pdf not_imb_D_N_N_D.pdf not_imb_T_N_N_T.pdf not_imb_T_D_D_T.pdf --nup 6x1 --landscape --outfile not_imb_all_bxplt.pdf
pdfcrop non_sig_all_bxplt.pdf 
pdfcrop imb_all_bxplt.pdf 
pdfcrop not_imb_all_bxplt.pdf 
pdfjam non_sig_all_bxplt-crop.pdf  not_imb_all_bxplt-crop.pdf imb_all_bxplt-crop.pdf   --nup 1x3 --delta '10 10' --landscape --outfile combined.pdf
pdfcrop combined.pdf

pdfjam onlyQ4_T_T.pdf onlyQ4_N_N.pdf onlyQ4_D_D.pdf onlyQ4_D_N_N_D.pdf onlyQ4_T_N_N_T.pdf onlyQ4_T_D_D_T.pdf --nup 6x1 --landscape --outfile onlyQ4_all_bxplt.pdf
pdfcrop onlyQ4_all_bxplt.pdf 

