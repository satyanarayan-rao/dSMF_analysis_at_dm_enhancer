#!/bin/bash 
peak_id=$1
mnase=`echo $peak_id | awk -F'_dist_' '{print $1}'`
dist=`echo $peak_id | awk -F'_dist_' '{print $2}' | awk -F'_' '{print $1}'`
dist_minus_15=`echo "$dist - 15" | bc `
dist_plus_15=`echo "$dist + 15" | bc `
cat << EOT > peak_footprint.gplt
reset
set terminal postscript size 4.5in,7.5in font 'Arial, 15'
set tmargin 1
set bmargin 0
set lmargin 3
set rmargin 3
set xra [-150: 150]
unset xtics
unset ytics
unset colorbox
set style rect fc lt -1 fs solid 0.1 noborder
set obj rect from -15, graph 0 to 15, graph 1
set obj rect from ${dist_minus_15}, graph 0 to ${dist_plus_15}, graph 1
set output 'peak_footprint.eps'
set multiplot layout 12, 1
plot '${mnase}_mnase.tsv' u 1:2 w l lc rgb "#31a354" lw 2  notitle
load '../scripts/footprint_params.gplt'
EOT
sh ../scripts/commands.sh >> peak_footprint.gplt

cat << EOJ >> peak_footprint.gplt
plot 'fp_sort' mat u (\$1 -300):2:3 w image notitle
EOJ

####################################################


cat << EOT > peak_methylation.gplt
reset
set terminal postscript size 4.5in,7.5in font 'Arial, 15'
set tmargin 1
set bmargin 0
set lmargin 3
set rmargin 3
set xra [-150: 150]
unset xtics
unset ytics
unset colorbox
set style rect fc lt -1 fs solid 0.1 noborder
set obj rect from -15, graph 0 to 15, graph 1
set obj rect from ${dist_minus_15}, graph 0 to ${dist_plus_15}, graph 1
set output 'peak_methylation.eps'
set multiplot layout 12, 1
plot '${mnase}_mnase.tsv' u 1:2 w l lc rgb "#31a354" lw 2  notitle
load '../scripts/methylation_params.gplt'
EOT
sh ../scripts/commands.sh >> peak_methylation.gplt

cat << EOJ >> peak_methylation.gplt
plot 'methyl_sort' mat u (\$1 -300):2:3 w image notitle
EOJ
