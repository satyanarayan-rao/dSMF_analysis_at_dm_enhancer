rm all_plt
cat >> all_plt << eofx
load './plt'
eofx
for i in `seq 41 65`
do
	head -n $i methyl_sort | tail -n 1 | awk '{for(i=1;i<NF;i++){print i-NF/2,$i}}'    > jnk_${i}
	head -n $i fp_sort | tail -n 1 | awk '{for(i=1;i<=NF;i++){print i-(NF+1)/2,$i}}' > jnk1_${i}
	cat >> all_plt << eof1
set output "${i}.pdf"
plot './jnk_${i}' w impulse lw 3 lc rgb "#D95F02", './jnk1_${i}' u 1:(\$2+0.2)  w l lw 2 lc rgb "#31A354"
eof1
done
