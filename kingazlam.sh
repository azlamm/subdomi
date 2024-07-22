#! /usr/bin/bash

echo ""
echo "
SS\       SS\                                         SS\                         
ss |                                                  SS |              
SS |  SS\ SS\ SSSSSSS\   SSSSSS\   SSSSSS\  SSSSSSSS\ SS | SSSSSS\  SSSSSS\SSSS\  
SS | SS  |SS |SS  __SS\ SS  __SS\  \____SS\ \____SS  |SS | \____SS\ SS  _SS  _SS\ 
SSSSSS  / SS |SS |  SS |SS /  SS | SSSSSSS |  SSSS _/ SS | SSSSSSS |SS / SS / SS |
SS  _SS<  SS |SS |  SS |SS |  SS |SS  __SS | SS  _/   SS |SS  __SS |SS | SS | SS |
SS | \SS\ SS |SS |  SS |\SSSSSSS |\SSSSSSS |SSSSSSSS\ SS |\SSSSSSS |SS | SS | SS |
\__|  \__|\__|\__|  \__| \____SS | \_______|\________|\__| \_______|\__| \__| \__|
                        SS\   SS |                                                
                        \SSSSSS  |                                                
                         \______/ "                                             
echo ""
greetings(){
echo "Welcome `tput setaf 1` $USER! `tput sgr0`. You are using `tput setaf 6` LIVE SUBDOMAINS FINDER `tput sgr0` coded by `tput setaf 3` azlamak `tput sgr0`" 
echo "Please make sure you have `tput setaf 4`'assetfinder' "
}
greetings
echo =============================================================================
read -p "`tput setaf 5` Enter the Domain `tput sgr0` : " dom
echo " `tput setaf 4` It may take a while depending on the number of subdomains. Sit back and please wait :) `tput sgr0` "
end(){
echo " `tput sgr0` ==== `tput setaf 3` mission Completed!. Thank you for using `tput sgr0` `tput setaf 6` LIVE SUBDOMAINS FINDER :) `tput sgr0` ===="
} 
step1()
{
assetfinder --subs-only $dom > subs.txt
}
step2()
{
cat subs.txt | httprobe `tput sgr0` > livesubs.txt
}
step3()
{
while read url ; do
	echo ${url#*//} >> urls.txt
done < livesubs.txt
sort -u urls.txt > sorted_subs.txt
echo "++++++++  Live Subdomains of `tput setaf 5` $dom `tput sgr0` ++++++++" `tput setaf 2`
cat  sorted_subs.txt 
echo "`tput setaf 4`======================================== `tput sgr0`"
echo "Result saved in `tput setaf 1` livesubs.txt `tput sgr0`"
rm urls.txt
rm livesubs.txt
rm subs.txt
}
step1
step2
step3
end
