for i in 0 1 3 4 5 7 2 6 8
do 
	#/bin/echo -n "$i "
	grep -c "#${i}" peak_*_nine_state_fp.tsv
done | awk '{if(NR>1){print "set arrow "NR-1" from -200 , "a" to 150, "a" front lc rgb \"#636363\" lw 2 nohead\nset label "NR-1" \"n = "b"\" at -160, "a-b/2" right front";a+=$1} else{a=$1};b=$1} END {print "set arrow "NR" from -200 , "a+b" to 150, "a+b" front lc rgb \"#636363\" lw 2 nohead\nset label "NR" \"n = "b"\" at -160, "a-b/2" right front"}'

#for i in 0 1 3 4 5 7 2 6 8
#do 
#	#/bin/echo -n "$i "
#	grep -c "#${i}" peak_*_nine_state_fp.tsv
#done | awk '{if(NR>1){print a,b;a+=$1} else{a=$1};b=$1} END {print a,b}' 

lno=`cat peak_*_nine_state_fp.tsv | wc -l | awk '{print $1}'`
echo "set yra [${lno}:0]"
