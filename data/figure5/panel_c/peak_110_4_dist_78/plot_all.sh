#!/bin/bash
sh gen_plt_files.sh $1 
gnuplot peak_footprint.gplt
gnuplot peak_methylation.gplt 
ps2pdf peak_footprint.eps
ps2pdf peak_methylation.eps
pdfcrop peak_footprint.pdf
pdfcrop peak_methylation.pdf
pdfjam peak_methylation-crop.pdf peak_footprint-crop.pdf --nup 2x1  --landscape --outfile both.pdf
