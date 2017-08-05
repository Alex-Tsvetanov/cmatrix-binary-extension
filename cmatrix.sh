symbols=$1
if [[ -z "$symbols" ]];
then
	symbols="01"
fi

color=$2
if [[ -z "$color" ]];
then
	color="32"
fi


echo -ne "\e[`echo -n $color`m"; 
line=0
COLUMNS=$((`tput cols`));
while $t; 
do 
	full_line=""; 
	for i in `seq 1 $(($COLUMNS + 2))`; 
	do 
		h=$(($RANDOM % ${#symbols})); 
		full_line="`echo -n "$full_line"`${symbols:$h:1}"; 
	done; 
	echo -n "$full_line";
	if [[ $line -eq $((`tput lines`)) ]];
	then 
		line=0;
	else
		line=$(($line+1));
	fi
done;
