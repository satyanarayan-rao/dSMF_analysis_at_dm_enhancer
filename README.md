# dual Enzyme Single Molecule Footprinting (dSMF) analysis at Drosophila Enhancers

## Data and scripts to generate figure panels

### Figure 4

#### Panel A: percentage methylation distribution in open and closed enhancers

Data: 

- `data/figure4/panel_a/open_enh.tsv.gz`
- `data/figure4/panel_a/closed_enh.tsv.gz`

```
$ cd data/figure4/panel_a/
$ gunzip open_enh.tsv.gz 
$ gunzip closed_enh.tsv.gz
$ cd - 
$ Rscript scripts/plot_percentage_methylation_on_reads.R \
  data/figure4/panel_a/open_enh.tsv \
  data/figure4/panel_a/closed_enh.tsv \
  4 \
  5 \
  figures/figure4/panel_a/open_vs_closed.dist.pdf \
  figures/figure4/panel_a/open_vs_closed.dist.png \
  figures/figure4/panel_a/open_vs_closed.smooth.dist.pdf \
  figures/figure4/panel_a/open_vs_closed.smooth.dist.png \
  figures/figure4/panel_a/open_vs_closed.ecdf.pdf \
  figures/figure4/panel_a/open_vs_closed.ecdf.png \
  figures/figure4/panel_a/open_vs_closed.cnt.pdf \
  figures/figure4/panel_a/open_vs_closed.cnt.png \
  
```
