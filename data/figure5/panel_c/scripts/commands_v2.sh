rm fp_sort methyl_sort

for j in 0 1 3 4 5 7 2 6 8
do

	rm jnk
	
	awk '{print $0,NR}' peak_${1}_nine_state_fp.tsv| grep "83~163" | grep "\#${j}" | sort -k2,2g > jnk 
	
	/bin/echo -n "$j 83 "
	wc -l jnk

	for i in `awk '{print $5}' jnk`
	do
		head -n $i peak_${1}_nine_state_mvec.tsv | tail -n 1 | awk '{print $4}' | sed 's/M/-1 /g' | sed 's/\./0 /g' | sed 's/[h,z,x,u]/1 /g' | sed 's/[H,Z,X,U]/2 /g'   >> methyl_sort
	done
	
	awk '{print $4}' jnk | sed 's/M/-1 /g' | sed 's/F/1 /g' | sed 's/\./0 /g' >> fp_sort
	
	###################################################################################
	
	rm jnk 

	awk '{print $0,NR}' peak_${1}_nine_state_fp.tsv | grep "99~147" | grep "\#${j}" | sort -k2,2g > jnk 
	
	/bin/echo -n "$j 99 "
	wc -l jnk
	for i in `awk '{print $5}' jnk`
	do
		head -n $i  peak_${1}_nine_state_mvec.tsv | tail -n 1 | awk '{print $4}' | sed 's/M/-1 /g' | sed 's/\./0 /g' | sed 's/[h,z,x]/1 /g' | sed 's/[H,Z,X]/2 /g'   >> methyl_sort
	done
	
	awk '{print $4}' jnk | sed 's/M/-1 /g' | sed 's/F/1 /g' | sed 's/\./0 /g' >> fp_sort
done
