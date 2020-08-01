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


#### Panel B: Example footprints

#### Panel C, D: Footprints 

Data: 


MNase data:  `data/figure4/panel_c_and_d/mnase_data.tsv`


+ Methylation vector: 

- With sam flag 83-163: `data/figure4/panel_c_and_d/mvec_83_order.tsv` 
- With sam flag 99-147: `data/figure4/panel_c_and_d/mvec_99_order.tsv` 

+ Footprint vector:

- With sam flag 83-163: `data/figure4/panel_c_and_d/83_order.tsv`
- With sam flag 99-147: `data/figure4/panel_c_and_d/99_order.tsv`


First order footrpints based on footprint length and location and then plot: 

```
$ cd data/figure4/panel_c_and_d/ 
$ sh order_by_flen_and_loc.sh 
$ gnuplot  peak_229_3_methylation.gplt 
$ gnuplot  peak_229_3_footprint.gplt 
```

#### Panel E: Obs vs expected footprint length distribution in open and closed enhancers

Data: 

- Observed (Open): `data/figure4/panel_e/open_130_5bp.hist` 
- Observed (Closed): `data/figure4/panel_e/closed_130_5bp.hist` 

```
$ gnuplot data/figure4/panel_e/obs_vs_expected.gplt
```


#### Panel F: Percentage occupancies of Naked, TF, and Nucleosome

Data:

- `data/figure4/panel_f/occupancy_open.tsv`
- `data/figure4/panel_f/occupancy_closed.tsv`

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

### Figure 5 

#### Panel A: DNA molecule count distribution

Data:
- `data/figure5/panel_a/cobinding_data_with_normalized_extent_of_cobinding.tsv`

```
$ Rscript scripts/cobinding_dna_molecule_count_distribution.R data/figure5/panel_a/cobinding_data_with_normalized_extent_of_cobinding.tsv
```


#### Panel B: 

#### Panel C: Cobinding example plot 

Data:

- Methylation vector: `data/figure5/panel_c/peak_110_4_dist_78/peak_110_4_dist_78_nine_state_mvec.tsv`
- Footprint vector: `data/figure5/panel_c/peak_110_4_dist_78/peak_110_4_dist_78_nine_state_fp.tsv`

```
$ cd data/figure5/panel_c/peak_110_4_dist_78/
$ sh ../scripts/plot_all.sh peak_110_4_dist_78 
```

Figures are found in: 
- `data/figure5/panel_c/peak_110_4_dist_78/peak_methylation.pdf`
- `data/figure5/panel_c/peak_110_4_dist_78/peak_footprint.pdf`


#### Panel D: Six state ccupancy boxplots

Data: 
- `data/figure5/panel_d/cobinding_data_six_states.tsv`

```
$ Rscript scripts/boxplt_cobinding_six_states.R data/figure5/panel_d/cobinding_data_six_states.tsv
```

### Figure 6

#### Panel A: extent of co-binding analysis

Data:

- `data/figure6/panel_a/normalized_extent_of_cobinding.tsv`

```
$ Rscript scripts/phyper_extent_of_cobinding.R data/figure6/panel_a/normalized_extent_of_cobinding.tsv
```

#### Panel B: Frequnecy of number of enhancers with co-binding events

Data:
- `data/figure6/panel_b/cobinding_frequency_at_enh.tsv`

```
$ cd data/figure6/panel_b
$ gnuplot barplt.gplt
```


#### Panel C: Peak distance distribution agiainst extent of co-binding 

Data:

- `data/figure6/panel_c/dist_(1,2,3,4).hist`

```
$ cd data/figure6/panel_c
$ gnuplot line_plot.gplt
```

#### Panel D: Boxplot of occupancies for different classes of co-binders

Data: 
- `data/figure6/panel_d/imb_with_occupancy_data.tsv`

```
$ cd data/figure6/panel_d
$ Rscript three_groups.R
$ cd plots_imb

```

#### Panel E and F: ChIP and CATCH-IT analysis

Data:
- `data/figure6/panel_e_and_f/`


```
$ cd data/figure6/panel_e_and_f/ 
$ Rscript Analysis_wFlag_clean.R
```

