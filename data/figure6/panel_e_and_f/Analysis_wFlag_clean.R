library(ggplot2)
dat <- read.csv(file='H3_ChIP_COBIND_dual.score', sep=' ',header=F)
colnames(dat) = c("Q","chr","peak","dist","Score","Non-norm_Score","Norm","LWidth","RWidth")
dat$uniq_peak_id = paste(dat$peak,dat$dist,sep="_")

scores <- read.csv(file='scores_w_imb.qlist',sep=' ',header=F)
colnames(scores) = c("QS","chr","peak","pos","str","dist","cobind_score","pval","FLAG")
scores$uniq_peak_id = paste(scores$peak,scores$dist,sep="_")


dat <- merge(dat,scores,by = "uniq_peak_id")

sub_dat = data.frame(Q=dat$Q,Score=dat$Score,Cobind_score=dat$cobind_score,
                    Uniq_Peak_ID=dat$uniq_peak_id,pval=dat$pval,flag=dat$FLAG)

a5 <- ggplot(data=sub_dat[sub_dat$Q==4,]) + 
  geom_boxplot(aes(x=flag,y=Score,fill=flag),notch = T)  + ylim(0,2) +
  theme(aspect.ratio = 1.25, text = element_text(size=18), legend.position = "none",
        panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.text.x = element_text(angle=345,hjust=0.1)) + xlab("") + ylab("H3 ChIP Score") +
  scale_x_discrete(labels=c("01_NOT_SIG" = "Independent", "02_IMB" = "Pioneer",
                            "03_NOT_IMB" = "Co-bound")); a5
im_file <- "05_onlyQ4_H3_ChIP.pdf"
ggsave(im_file,plot=a5,width=3,height = 4,dpi=320,units="in")

pval_3_2= ks.test(sub_dat[sub_dat$Q==4 & sub_dat$flag=="03_NOT_IMB",2],sub_dat[sub_dat$Q==4 & sub_dat$flag=="02_IMB" ,2])
pval_3_1=ks.test(sub_dat[sub_dat$Q==4 & sub_dat$flag=="03_NOT_IMB",2],sub_dat[sub_dat$Q==4 & sub_dat$flag=="01_NOT_SIG" ,2])
pval_2_1=ks.test(sub_dat[sub_dat$Q==4 & sub_dat$flag=="01_NOT_SIG",2],sub_dat[sub_dat$Q==4 & sub_dat$flag=="02_IMB" ,2])

pval_3_2$p.value
pval_3_1$p.value
pval_2_1$p.value

###############################################################################################

#CATCHIT
dat_c <- read.csv(file='CATCHIT_PD_COBIND_dual.score', sep=' ',header=F)
colnames(dat_c) = c("Q","chr","peak","dist","Score","Non-norm_Score","Norm","LWidth","RWidth")
dat_c$uniq_peak_id = paste(dat_c$peak,dat_c$dist,sep="_")

scores <- read.csv(file='scores_w_imb.qlist',sep=' ',header=F)
colnames(scores) = c("QS","chr","peak","pos","str","dist","cobind_score","pval","FLAG")
scores$uniq_peak_id = paste(scores$peak,scores$dist,sep="_")


dat_c <- merge(dat_c,scores,by = "uniq_peak_id")

sub_dat_c = data.frame(Q=dat_c$Q,Score=dat_c$Score,Cobind_score=dat_c$cobind_score,
                     Uniq_Peak_ID=dat_c$uniq_peak_id,pval=dat_c$pval,flag=dat$FLAG)

a5 <- ggplot(data=sub_dat_c[sub_dat_c$Q==4,]) + 
  geom_boxplot(aes(x=flag,y=Score,fill=flag),notch = T) + ylim(0,3) +
  theme(aspect.ratio = 1.25, text = element_text(size=18), legend.position = "none",
        panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.text.x = element_text(angle=345,hjust=0.1)) + xlab("") + ylab("CATCH-IT Score") +
  scale_x_discrete(labels=c("01_NOT_SIG" = "Independent", "02_IMB" = "Pioneer",
                            "03_NOT_IMB" = "Co-bound")); a5
im_file <- "05_onlyQ4_CATCH-IT.pdf"
ggsave(im_file,plot=a5,width=3,height = 4,dpi=320,units="in")

c_pval_3_2=ks.test(sub_dat_c[sub_dat_c$Q==4 & sub_dat_c$flag=="03_NOT_IMB",2],sub_dat_c[sub_dat_c$Q==4 & sub_dat_c$flag=="02_IMB" ,2])
c_pval_3_1=ks.test(sub_dat_c[sub_dat_c$Q==4 & sub_dat_c$flag=="03_NOT_IMB",2],sub_dat_c[sub_dat_c$Q==4 & sub_dat_c$flag=="01_NOT_SIG" ,2])
c_pval_2_1=ks.test(sub_dat_c[sub_dat_c$Q==4 & sub_dat_c$flag=="01_NOT_SIG",2],sub_dat_c[sub_dat_c$Q==4 & sub_dat_c$flag=="02_IMB" ,2])
c_pval_3_2$p.value
c_pval_3_1$p.value
c_pval_2_1$p.value
###############################################################################################
