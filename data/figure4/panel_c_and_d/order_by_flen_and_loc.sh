rm fp_sort methyl_sort

for j in 0 1 2
do

	rm jnk
	
	awk '{print $0,NR}' 83_order.tsv | grep "\#${j}" | sort -k2,2g > jnk 
	
	echo "$i 83"
	wc -l jnk

	for i in `awk '{print $5}' jnk`
	do
		head -n $i  mvec_83_order.tsv | tail -n 1 | awk '{print $4}' | sed 's/M/-1 /g' | sed 's/\./0 /g' | sed 's/[h,z,x]/1 /g' | sed 's/[H,Z,X]/2 /g'   >> methyl_sort
	done
	
	awk '{print $4}' jnk | sed 's/M/-1 /g' | sed 's/F/1 /g' | sed 's/\./0 /g' >> fp_sort
	
	##################################################################################3
	
	rm jnk 

	awk '{print $0,NR}' 99_order.tsv | grep "\#${j}" | sort -k2,2g > jnk 
	
	echo "$i 99"
	wc -l jnk
	for i in `awk '{print $5}' jnk`
	do
		head -n $i  mvec_99_order.tsv | tail -n 1 | awk '{print $4}' | sed 's/M/-1 /g' | sed 's/\./0 /g' | sed 's/[h,z,x]/1 /g' | sed 's/[H,Z,X]/2 /g'   >> methyl_sort
	done
	
	awk '{print $4}' jnk | sed 's/M/-1 /g' | sed 's/F/1 /g' | sed 's/\./0 /g' >> fp_sort
done
