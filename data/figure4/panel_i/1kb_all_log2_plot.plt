set terminal postscript size 6, 6 font 'Arial, 15'
set size ratio 2
#set palette defined  ( 0 '#fee5d9', 0.25 '#fcae91', 0.5 '#fb6a4a', 1 '#cb181d') 
#set palette defined (0 "#e66101", 0.25 "#fdb863", 0.5 "#ffffff", 0.75 "#b2abd2", 1 "#5e3c99")
#set palette defined (0 "#5e3c99", 0.25 "#b2abd2", 0.5 "#ffffff", 0.75 "#fdb863", 1 "#e66101")
#set palette defined (0 "#5e3c99", 0.167 "white", 0.5 "orange", 1 "red")
#set palette defined (0.0 "#0868ac", 0.1 "#ffffff", 0.2 "#1f78b4", 0.5 "#b2df8a",  0.7 "#33a02c", 0.9 "#fb9a99", 1.0 "#e31a1c")
set palette defined (0.0 "#0868ac", 0.1 "#ffffff", 0.4 "#b2df8a",  0.6 "#33a02c", 0.8 "#fb9a99", 1.0 "#e31a1c")
set cblabel "Log2(short/nuc)"
set xlabel "Distance from peak center [bp]"
#set ylabel "All MNase peaks (Open Enhancer)"
set format y '%.0s%c'
set cbra [-1:5]
set output 'figures/figure4/panel_i/1kb_mnase_log2.eps'
set yra [1:10255]
set xtics ("-1000" 0, "0" 1000, "+1000" 2000) 
#set title 'Log2(short/nuc)'
set label 1 'TF/NUC = 0.08' at -500, -500 left rotate by 90 front 
set label 2 '0.32' at -500, 4000 left rotate by 90 front 
set label 3 '0.59' at -500, 8000 left rotate by 90 front 
 
set arrow 1 from -1000, 3073 to 2000, 3073 front nohead lc rgb '#000000'
set arrow 2 from -1000, 6393 to 2000, 6393 front nohead lc rgb '#000000' 
plot '<zcat data/figure4/figure_i/open_all_peaks_log2_1kb.csv.gz' matrix with image notitle
