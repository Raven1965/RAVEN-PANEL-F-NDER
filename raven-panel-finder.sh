#!bin/bash
clear
if [[ ! -a $PREFIX/bin/curl ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m CURL PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install curl -y
fi
if [[ ! -a $PREFIX/bin/grep ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m CURL PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install grep -y
fi

A=$( printf "\e[96mRAVEN-PANEL-FİNDER")
echo
echo
echo -e "\e[34m●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
echo -e "\e[34m●                               ●"
printf "\e[34m● %-35s\e[34m ●" "$A"
echo -e "\e[34m\n●                               ●"
echo -e "\e[34m●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
echo
echo -e "\e[34mörnek:https://site.com"
echo
echo
read -e -p $'\e[34m•••••••[ \e[96mSITE GIR\e[34m ]•••••••►  \e[0m' secim
echo
printf "\e[34mTARAMA BAŞLATILDI BİRAZ UZUN SÜRE BİLİR"
echo
#c=$(cat code)
#site=$(curl -s -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" -I -w \"%{http_code}\" "$secim")
panel=$(cat panel.txt)
for i in $panel ;do
	curl -s -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" -I -w \"%{url}\" "$secim/$i" > .code
	cat .code | grep HTTP | awk '{print $2}'>.code1
	c1=$(cat .code1)
	link=$(cat .code | grep '"' | tr -d '"')
	if [[ $c1 == 200 ]];then
	 	echo
		printf "\e[34m[✓]\e[96mADMİN PANEL BULUNDU"
		echo
		echo
		printf "\e[34m••••••► \e[96m$link"
		echo
		echo
		exit

	else 
		echo
		printf "\e[96mADMİN PANEL BULUNAMADI :/"
		echo
		echo
		exit
	fi	
		
		
done	
rm .code
rm .code1
		

