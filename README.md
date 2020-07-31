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


#### Panel F: Percentage occupancies of Naked, TF, and Nucleosome

Data:

- `data/figure4/panel_e/occupancy_open.tsv`
- `data/figure4/panel_e/occupancy_closed.tsv`

```
$ Rscript scripts/bxplt_violin.R
```

#### Panel G: K-means on occupancy matrix

Data: 

- `data/figure4/panel_g/open_peaks_nclust_3.ori.tsv`


```
$ gnuplot data/figure4/panel_g/open_peaks.ori.complete.gplt 

```


#### Panel H: Boxplot of k-means occupany by states

Data:

- `data/figure_4/panel_h/open_peaks_nclust_3.ori.tsv`


```
$ Rscript scripts/boxplt_by_state.R 
```

#### Panel I: MNase log2(Short/Long) heatmap in k-means clusters 

Data: 

- `data/figure4/panel_i/open_all_peaks_log2_1kb.csv.gz`

```
$ gnuplot data/figure4/panel_i/1kb_all_log2_plot.plt 
```
