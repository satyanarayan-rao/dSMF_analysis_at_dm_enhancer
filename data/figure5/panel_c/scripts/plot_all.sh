#!/bin/bash
peak_name=`echo $1 | sed 's:peak_::g'`
sh ../scripts/commands_v2.sh  $peak_name
sh ../scripts/gen_plt_files.sh $1 
gnuplot peak_footprint.gplt
gnuplot peak_methylation.gplt 
ps2pdf peak_footprint.eps
ps2pdf peak_methylation.eps
