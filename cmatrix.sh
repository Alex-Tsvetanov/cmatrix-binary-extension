echo -ne "\e[32m"; 
line=0
COLUMNS=$((`tput cols` / 2));
while $t; 
do 
	full_line=""; 
	for i in `seq 1 $COLUMNS`; 
	do 
		r="$[($RANDOM % 2)]"; 
		h="$[($RANDOM % 4)]"; 
		if [ $h -eq 1 ]; 
		then 
			full_line="`echo -n $full_line`0$r"; 
		else 
			if [ $h -eq 2 ]; 
			then 
				full_line="`echo -n $full_line`1$r"; 
			else
				full_line="`echo -n $full_line` $r"; 
			fi;
		fi; 
		#echo "asdf";
	done; 
	echo $full_line;
	if [[ $line -eq $((`tput lines`)) ]];
	then 
		line=0;
	else
		line=$(($line+1));
	fi
done;
