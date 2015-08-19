echo "+--------------------------------+"
echo "| Welcome to Phone Control Shell |"
echo "+--------------------------------+"

help(){
	echo "This is help"
}

about(){
	echo "This is the phone control shell of The Cyber Wings Team"
}

pkg_install(){
	read -p "Path of the package" pkgpath
	pm install $pkgpath
}

devinfo(){
	echo "- BUILD -"
	echo "Product: $(getprop ro.build.product)"
	echo "Description: $(getprop ro.build.description)"
	echo "Version: $(getprop net.bt.name) $(getprop ro.build.version.release)"
	echo "TimeZone: $(getprop persist.sys.timezone)"
	echo
	echo "- VERSIONS -"
	echo "Baseband: $(getprop gsm.version.baseband)"
	echo "RIL: $(getprop gsm.version.ril-impl)"
	echo 
	echo "- GSM -"
	echo "Operator: $(getprop gsm.sim.operator.alpha)"
	echo "Country: $(getprop gsm.sim.operator.iso-country)"
	echo "State: $(getprop gsm.sim.state)"
	echo
	echo "- Wireless-"
	echo "Interface: $(getprop wifi.interface)"
	echo "Config: $(getprop /system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini)"
	echo "Driver Status: $(getprop wlan.driver.status)"
	echo "IPv4: $(getprop dhcp.wlan0.ipaddress)"
	echo "Subnet: $(getprop dhcp.wlan0.mask)"
	echo "Gateway: $(getprop dhcp.wlan0.gateway)"
	echo "DNS1: $(getprop dhcp.wlan0.dns1)"
	echo "Lease Time: $(getprop dhcp.wlan0.leasetime)"                                 
	echo "Domain: $(getprop dhcp.wlan0.domain)"
	echo "Server: $(getprop dhcp.wlan0.server)"
}

viewsms(){
echo -n "Specific Number: " & read specnum
sqlite3 /data/data/com.android.providers.telephony/databases/mmssms.db '.dump "sms"'| grep "^INSERT" | sed 's/.*VALUES(\(.*\));/\1/' | awk -F"," '{ print "SMS from "$3": "$13 }' | grep $specnum
}

sendsms(){
echo -n "Dest Number: " & read destsmsnum
echo -n "SMS Body: " & read destsmsbody
am start -a android.intent.action.SENDTO -d sms:$destsmsnum --es sms_body "$destsmsbody" --ez exit_on_sent true
input keyevent 66
input keyevent 66
input keyevent 66
input keyevent 66
input keyevent 66
input keyevent 66
}

callnum(){
echo -n "Dest Number: " & read callnu
am start -a android.intent.action.CALL tel:$callnu
input keyevent 66                                                                                                                     
}

echo "THIS IS BETA: PLEASE USE THIS AT YOUR OWN RISK"
echo "YOU WILL NEED SQLITE3 PACKAGE TO VIEW SMS MESSAGES"
while true
do
echo -n "phctl> " && read var

	case $var in
		pkg_install) pkg_install
			;;
		help) help
			;;
		about) about
			;;
		sendsms) sendsms
			;;
		viewsms) viewsms
			;;
		callph) callnum
			;;
		*) eval $var
			;;
	esac
done

