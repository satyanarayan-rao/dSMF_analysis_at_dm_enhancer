library(ggplot2)
library(ggthemes)
library(reshape2)
dt = read.table("imb_with_occupancy_data.tsv", se= "\t", header = T, stringsAsFactors  = F)

#	     1	quantile
#	     2	chr
#	     3	peak_id
#	     4	chrStart
#	     5	strand
#	     6	sec_peak
#	     7	normalized_eob
#	     8	log10p_val
#	     9	imbalance
#	    10	D_D
#	    11	N_N
#	    12	D_N_N_D
#	    13	T_N_N_T
#	    14	T_D_D_T
#	    15	T_T

dt$quantile = as.character(dt$quantile)
print(head(dt))
#cols_for_bxplt = c("D.D", "N.N", "D.N.N.D", "T.N.N.T", "T.D.D.T", "T.T") 
cols_for_bxplt = c("T_T", "N_N", "D_D", "D_N_N_D", "T_N_N_T", "T_D_D_T") 
label_list = list() 
label_list["D_D"] = "DNA-DNA"
label_list["N_N"] = "Nuc-Nuc"
label_list["D_N_N_D"] = "DNA-Nuc/Nuc-DNA"
label_list["T_N_N_T"] = "TF-Nuc/Nuc-TF"
label_list["T_D_D_T"] = "TF-DNA/DNA-TF"
label_list["T_T"] = "TF-TF"
cnt = 0

figure2_theme <- function (){
    theme (axis.text.y =element_text(vjust =1))+
    theme(plot.title=element_text( size=28 )) +
    theme(axis.title.x = element_text(colour = "black", size = 28),
          axis.title.y = element_text(colour = "black", size = 28)) +
    theme(axis.text.x = element_text(size = 28),
          axis.text.y = element_text(size = 28)) +
    theme(legend.title= element_text(size = 28),
          legend.text = element_text(size = 28)) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5))
}

################### non-significant #########################
#for (col in cols_for_bxplt){
#
#    dt_sub = dt[which(dt$imbalance == "01_NOT_SIG"), c(col, "quantile")]  
#    plt = ggplot(dt_sub, aes_string(x = "quantile", y = col, fill = "quantile")) + geom_boxplot(notch = T) + 
#          geom_rangeframe() + theme_few() + ggtitle(label_list[col])  + figure2_theme() + xlab ("") + 
#          #scale_fill_manual(values = c("1" = "#a6cee3", "2" = "#1f78b4", "3" = "#33a02c", "4" = "#e31a1c"))
#          scale_fill_manual(limits = c ("1", "2", "3", "4"),
#                            values = c("1" = "#a6cee3", "2" = "#1f78b4", "3" = "#33a02c", "4" = "#e31a1c")) +  
#          scale_x_discrete(limits = c("1", "2", "3", "4"), 
#                           labels = c("1" = "0-25", "2" = "25-50", "3" = "50-75", "4" = "75-100")) + 
#          theme(legend.position = "none") + 
#          theme(axis.text.x = element_blank(), #element_text(angle = 45, hjust = 1), 
#                plot.title = element_text(hjust = 0.5),
#                )
#    if (cnt == 0) {
#         plt = plt +  ylab("%Occup [NON SIG]") 
#    } else{
#         plt = plt + ylab("")
#    }
#    if (cnt %in% c(0,4)){
#        plt = plt + ylim(c(0,25))
#    }else if (cnt == 5){
#        plt = plt + ylim(c(0,40))
#    }else if (cnt == 3){
#        plt = plt + ylim(c(0,60))
#    }else if (cnt == 1){
#        plt = plt + ylim(c(0,80))
#    }
#    pdf(paste0("plots_imb/non_sig_", col, ".pdf"), width = 4, height = 6)
#    print(plt)
#    dev.off()
#    cnt = cnt + 1
#}
#cnt = 0 
#################### significant with imbalance #########################
#for (col in cols_for_bxplt){
#    # imbalance strings:
#    
#    #   3548 01_NOT_SIG
#    #    408 02_IMB
#    #   1153 03_NOT_IMB
#    
#    dt_sub = dt[which(dt$imbalance == "02_IMB"), c(col, "quantile")]  
#    plt = ggplot(dt_sub, aes_string(x = "quantile", y = col, fill = "quantile")) + geom_boxplot(notch = T) + 
#          geom_rangeframe() + theme_few() + xlab("")  + figure2_theme() + 
#          #scale_fill_manual(values = c("1" = "#a6cee3", "2" = "#1f78b4", "3" = "#33a02c", "4" = "#e31a1c"))
#          scale_fill_manual(limits = c ("1", "2", "3", "4"),
#                            values = c("1" = "#a6cee3", "2" = "#1f78b4", "3" = "#33a02c", "4" = "#e31a1c")) +  
#          scale_x_discrete(limits = c("1", "2", "3", "4"), 
#                           labels = c("1" = "0-25", "2" = "25-50", "3" = "50-75", "4" = "75-100")) + 
#          theme(legend.position = "none") + 
#          theme(axis.text.x = element_text(angle = 45, hjust = 1))
#    if (cnt == 0) {
#         plt = plt +  ylab("%Occup [IMB]") 
#    } else{
#         plt = plt + ylab("")
#    }
#    if (cnt %in% c(0,4)){
#        plt = plt + ylim(c(0,25))
#    }else if (cnt == 5){
#        plt = plt + ylim(c(0,40))
#    }else if (cnt == 3){
#        plt = plt + ylim(c(0,60))
#    }else if (cnt == 1){
#        plt = plt + ylim(c(0,80))
#    }
#    pdf(paste0("plots_imb/imb_", col, ".pdf"), width = 4, height = 6)
#    print(plt)
#    dev.off()
#    cnt = cnt + 1
#}
#
#cnt = 0
#
#################### significant without imbalance #########################
#for (col in cols_for_bxplt){
#    # imbalance strings:
#    
#    #   3548 01_NOT_SIG
#    #    408 02_IMB
#    #   1153 03_NOT_IMB
#    
#    dt_sub = dt[which(dt$imbalance == "03_NOT_IMB"), c(col, "quantile")]  
#    plt = ggplot(dt_sub, aes_string(x = "quantile", y = col, fill = "quantile")) + geom_boxplot(notch = T) + 
#          geom_rangeframe() + theme_few() + xlab("")  + figure2_theme() + 
#          #scale_fill_manual(values = c("1" = "#a6cee3", "2" = "#1f78b4", "3" = "#33a02c", "4" = "#e31a1c"))
#          scale_fill_manual(limits = c ("1", "2", "3", "4"),
#                            values = c("1" = "#a6cee3", "2" = "#1f78b4", "3" = "#33a02c", "4" = "#e31a1c")) +  
#          scale_x_discrete(limits = c("1", "2", "3", "4"), 
#                           labels = c("1" = "0-25", "2" = "25-50", "3" = "50-75", "4" = "75-100")) + 
#          theme(legend.position = "none") + 
#          theme(axis.text.x = element_text(angle = 45, hjust = 1))
#    if (cnt == 0) {
#         plt = plt +  ylab("%Occup [NOT IMB]") 
#    } else{
#         plt = plt + ylab("")
#    }
#    if (cnt %in% c(0,4)){
#        plt = plt + ylim(c(0,25))
#    }else if (cnt == 5){
#        plt = plt + ylim(c(0,40))
#    }else if (cnt == 3){
#        plt = plt + ylim(c(0,60))
#    }else if (cnt == 1){
#        plt = plt + ylim(c(0,80))
#    }
#    pdf(paste0("plots_imb/not_imb_", col, ".pdf"), width = 4, height = 6)
#    print(plt)
#    dev.off()
#    cnt = cnt + 1
#}
#


####################### just take quantile 4 and group them by IMB #################

dt_sub = dt[which(dt$quantile == 4),c (cols_for_bxplt, "imbalance")]  
mdt_sub = melt(dt_sub, id.vars = "imbalance")
print (head(mdt_sub))

plot_order = c("T_T", "N_N", "D_D", "D_N_N_D", "T_N_N_T", "T_D_D_T")
ylim_list = list()
ylim_list["T_T"] = 25
ylim_list["N_N"] = 75
ylim_list["D_D"] = 75
ylim_list["D_N_N_D"] = 50
ylim_list["T_N_N_T"] = 50
ylim_list["T_D_D_T"] = 75
cnt = 0 
for (ty in plot_order){
    plt = ggplot(mdt_sub[mdt_sub$variable == ty, ], aes( y = value, x = imbalance, fill = imbalance)) + 
          geom_boxplot(notch = T) + geom_rangeframe() + theme_few() + #figure2_theme() + 
          theme (legend.position = "none") + ggtitle(label_list[ty]) + theme(plot.title = element_text(hjust = 0.5)) + 
          ylim(c(0, ylim_list[[ty]])) + xlab ("") +  figure2_theme() + 
          scale_x_discrete(limits = c("01_NOT_SIG", "02_IMB", "03_NOT_IMB"),
                           labels = c("01_NOT_SIG" = "N.S.", "02_IMB" = "IMB", "03_NOT_IMB" = "NOT_IMB")) + 
          theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
    if (cnt == 0){
        plt = plt + ylab("%Occupancy") 
    }else{
        plt = plt + ylab("")
    }
    
    pdf(paste0("plots_imb/onlyQ4", "_", ty, ".pdf" ), width = 4.5, height = 6)  
    print(plt)
    dev.off()
    cnt = cnt + 1
}

