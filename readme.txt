* Updated version available at "46.101.65.49/smartwifi/readme.txt" *
* Last updated on Tue, 01 Mar 2016 12:00:00 IST *

* GPIO PIN MAPPING - ESP8266 vs NODEMCU *
P0  = 3
P1  = 10
P2  = 4
P3  = 9
P4  = 1
P5  = 2
P9  = 11
P10 = 12
P12 = 6
P13 = 7
P14 = 5
P15 = 8
P16 = 0

* UTILITY FILES *

1
Utility
	blinkrgb.lc
Syntax
	call("blinkrgb", nn, color)
Parameters
	nn : number of times blinking should happen
	color : color in which LED should blink - default nil
Description
	Blink on board RGB LED <n> number of times; <n> is given as second parameter and it is optional.
	If no parameter is passed, default value of 1 is assigned. Another parameter is color where blinking
	can be restricted to single color, if color is specified, then LED blinks nn times in given color,
	else blinks nn times in multicolor.
Returns
	Nothing
	
2
Utility
	connectap.lc
Syntax
	call("connectap", ssid, pass, callback-function-1, callback-function-2)
Parameters
	ssid : SSID of wifi router
	pass : password of wifi router, provide empty string for no-password
	callback-function-1 : call back function after successful connection
	callback-function-2 : call back function after connection failure
Description
	Connects to access-point / wifi-router. If no parameters are passed, the values available in system.cfg
	file are taken by default. In case those values not present, function doesn't do anything.
Returns
	On success
		connectap: connected (ip.ip.ip.ip) [rssi]
	On failure
		connectap: not connected
	On error
		context dependent error string

3
Utility
	dir.lc
Syntax
	call("dir")
Parameters
	None
Description
	This utility displays files available on the module in list format with serial number, file name
	with extension and byte size of the file.
Returns
	Nothing
	
4
Utility
	ds18b20.lc
Syntax
	call("ds18b20", pin);
Parameters
	pin : pin name to which sensor output is connected
Description
	Reads single sensor temperature from one-wire-sensor DS18B20 and provides temperature value at output.
Returns
	On success
		ds18b20: <temperature value>
	On failure / error
		context dependent error string

5
Utility
	gethmac.lc
Syntax
	call("gethmac", type, data, key, base)
Parameters
	type : type of encryption given as a string - MD5 (default), SHA1, SHA256, SHA384, SHA512
	data : string which has to be encrypted - default empty string
	key : salt / key for hash calculation - default empty string
	base : conversion base, set true for base64 type or false for hex (default)
Description
	Encrypts data using HMAC algorithm and provides output hash in hex or base-64 format.
Returns
	On success
		gethmac: <hmac - hash string>
	On failure / error
		context dependent error string

6
Utility
	eval.lc
Syntax
	call("eval", expression)
Parameters
	expression : string expression to be evaluated
Description
	Works as a expression / calculation evaluator.
Returns
	On success
		eval: <evaluation result>
	On failure / error
		context dependent error string

7
Utility
	findap.lc
Syntax
	call("findap")
Parameters
	None
Description
	Searches for available access points within the range and displays them on screen. Values displayed
	are ssid, bssid, rssi, authmode and channel for each access point.
Returns
	Nothing
	
8
Utility
	getinfo.lc
Syntax
	call("getinfo")
Parameters
	None
Description
	Provides general information about the module hardware, firmware and middle-ware.
Returns
	Nothing

9
Utility
	createap.lc
Syntax
	call("createap", ssid, pass)
Parameters
	ssid : name / ssid of the createap - as per system.cfg hotspotSSID or smartWIFI_<mac-id> (default)
	pass : password for connection - as per system.cfg apPassword or smartwifi (default)
Description
	Starts the hotspot on wifi module with given parameters. Once module starts acting as a hotspot,
	it can be connected directly on 192.168.4.1 using given SSID and Password. This utility refers to 
	system.cfg parameters, if parameters are not passed / incorrectly passed then module picks values 
	from configuration file; if parameters are not available in configuration file, then default values
	are considered.
Returns
	Nothing
	
10
Utility
	httpsend.lc
Syntax
	call("httpsend", url-end-point, url-parameters)
Parameters
	url-end-point : main url for connection - do not add http:// only provide www.xxxx onwards. If there is
	specific port to be mentioned, provide it with ':' separator, if nothing is provide default 80 port will be used
	url-parameters : string for remaining part of the url
Description
	This utility sends GET request to given url-end-point with parameters specified in url-parameters.
Returns
	On success
		httpsend: <received data payload>
	On failure
		Nothing
	On error
		context dependent error string
		
11
Utility
	initmqtt.lc
Syntax
	call("initmqtt", mqttbroker, mqttuser, mqttpass, keepalive, callback-function)
Parameters
	mqttbroker : broker address string
	mqttuser : user name for broker connection
	mqttpass : password for broker connection
	keepalive : number of seconds connections should be alive - if supplied nil / not supplied, 600 sec is by default
	callback-function : name of the function for callback when mqtt message arrives - nil by default
Description
	Initiates mqtt connection with online broker with given parameters. Once the successful connection
	has been established, other sub-functions (11.1 ~ 11.4) under this utility can be used for further
	communication / data transfer. Code uses deviceID as a clientID for connection with broker. If no 
	deviceID is available, MAC ID is used.
Returns
	On success
		mqtt: online
	On failure / error
		context dependent error string

11.1 getBroker() - returns broker address string
11.2 mqttPub(topic, value, QoS, dataRetain) - publish value to specified topic at given QoS and retain / not retain data
11.3 mqttSub(topic, QoS) - subscribe to specified topic at given QoS level
11.4 mqttClose - terminates mqtt connection
11.5 mqttStatus() - returns true if online and nil if offline
11.6 mqttUnsub(topic) - unsubscribe from specified topic

12
Utility
	log10.lc
Syntax
	call("log10", value, resolution)
Parameters
	value : value for which log should be calcualted
	resolution : output resolution to <nn> digits - 20 (default)
Description
	Calculated logarithm to the base 10 for given values, reduces the output to given resolution
	of <nn> digits.
Returns
	On success
		log10: <log value>
	On failure / error
		context dependent error string

13
Utility
	makebinary.lc
Syntax
	call("makebinary")
Parameters
	None
Description
	Compiles all the LUA files to LC files and then removes LUA files. This is batch compile utility.
	For single file compilation, use node.compile(filename).
Returns
	Nothing

14
Utility
	rtc.lc
Syntax
	call("rtc")
Parameters
	none
Description
	Utility returns real time value along with full date in epoch format; value returned is GMT.
Returns
	On success
		rtc: <time value>
	On failure / error
		context dependent error string

15
Utility
	readfile.lc
Syntax
	call("readfile", filename)
Parameters
	filename - name of the file to be read - "system.cfg" by default
Description
	Reads file contents of the file specified and show the output on screen.
Returns
	Nothing
	
16
Utility
	server.lc
Syntax
	call("server", filename, callback-function)
Parameters
	filename : file to be served as home page for module server - "homepage.html" (default)
	callback-function : function to be called back after payload is received on local server, function
	is passed with url parameters
Description
	Starts local server on wifi module which can be accessed using ip address assigned to the module
	by wifi router or on 198.162.4.1 by connecting to module's hotspot. For each connection / post
	submit on that homepage, module returns data received with length of data.
Returns
	On success
		server: received <datalen> <data>
	On failure / error
		context dependent error string

16.1 stopServer() - stops the running server, applicable and available only if server is already running.

17
Utility
	setLED.lc
Syntax
	call("setLED", color)
Parameters
	color : color-code for lighting up on-board RGB LED - 0 (default) through 7
Description
	Lights up on-board RGB LED with given color code. Values are considered only upto 3 bits 000 to 111.
	For higher values, last 3 bits would be used.
Returns
	Nothing

18
Utility
	strpad.lc
Syntax
	call("strpad", str, padchar, padcount)
Parameters
	str : target string to which padchar to be padded
	padchar : character / string to be padded to string
	padcount : number of times padding to be applied
Description
	Used for padding the strings with given character / string value for certain counts. If target string 
	is longer than padcount - no padding applied; padding is applied only for balance length where
	balance length = padcount - string length.
Returns
	On success
		strpad: <padded string>
	On failure / error
		context dependent error string

19
Utility
	urldecode.lc
Syntax
	call("urldecode", str)
Parameters
	str : url-encoded string
Description
	Decodes url-encoded string to normal string.
Returns
	On success
		urldecode: <decoded string>
	On failure / error
		context dependent error string

20
Utility
	urlencode.lc
Syntax
	call("urlencode", str)
Parameters
	str : normal string to be url-encoded
Description
	Encodes normal string to url-encoded string format.
Returns
	On success
		urlencode: <encoded string>
	On failure / error
		context dependent error string

21
Utility
	ssidconfig.lc
Syntax
	call("ssidconfig")
Parameters
	None
Description
	Presents local AP configuration page on the self-server; one can configure SSID and Password using this utility on the go.
Returns
	On success
		connectap: connected (ip.ip.ip.ip)
	On failure
		connectap: not connected
	On error
		context dependent error string
	
22
Utility
	xhttpsend.lc
Syntax
	call("xhttpsend", url-end-point, port, url-parameters, callback-function, output-save-file)
Parameters
	url-end-point : main url for connection - do not add http:// only provide www.xxxx onwards
	port : port number for url connection - 80 for normal websites
	url-parameters : string for remaining part of the url
	callback-function : local lua function to be called back once the script completes, function receives
		one parameter which is data-length of received payload - nil by default
	output-save-file : file name to which web response to be stored - nil by default
Description
	This utility sends GET request to given url-end-point with parameters specified in url-parameters.
	The output is only displayed or can be stored in output file.
Returns
	On success
		xhttpsend: <received data pyload>
	On failure
		Nothing
	On error
		context dependent error string
	
23
Utility
	autoupdate.lc
Syntax
	call("autoupdate", filename, showstatus, callback-function)
Parameters
	filename : name of the file to be updated from web-server
	showstatus : true / false value to enable / disable update status sending to console
	callback-function : local lua function to be called back once the script completes, function 
		receives update status as true or false - nil by default
Description
	This utility checks for new filename availability on web-server and accordingly updates specified
	file with available version.
Returns
	On success
		autoupdate: update complete for <filename> (<nn> bytes)
		- <nn> is no. of bytes in updated file
	On failure
		autoupdate: no updates available for <filename>
	On error
		context dependent error string 

24
Function
	call
Syntax
	call(utility_name, parameters)
Parameters
	utility_name : name of the utility LC script to be called - if LUA script to be called, specify full
	name with extension; by default LC script is invoked
	parameters : series of parameters as required by utility script
Description
	Runs the utility script with given parameters.
Returns
	On success
		true nil
		- indicating status as true and nil as error details
	On failure
		nil
		- indicating status failure as nil
	On error
		false <error string>
		- indicating status as false and context dependent error details
	
25
Function
	delay_ms
Syntax
	delay_ms(duration)
Parameters
	duration : delay time in milli-seconds
Description
	Adds blocking delay for the time period specified in duration variable.
Returns
	Nothing
	
26
Function
	delay_us
Syntax
	delay_us(duration)
Parameters
	duration : delay time in micro-seconds
Description
	Adds blocking delay for the time period specified in duration variable.
Returns
	Nothing

27
Function
	extract_retVal
Syntax 
	extract_retVal(utility_name)
Parameters
	utility_name : name of the recently executed utility for which output value needs to be extracted
	from retVal string.
Description
	The function will extract only return value from typical "utility: return value" format. This can
	be used for direct processing by the application code.
Returns
	Extracted retVal by removing utility_name from the output.

* SYSTEM FILES *

1
File-name
	init.lua
Description
	Init script; it runs everytime module starts / restarts - do not change without proper thought. If
	you need to bypass startup sequence and add one of your own, remove calls to main.lc file and add
	those for your scripts.

2
File-name
	main.lc
Description
	Main script which declares utility functions, global variables, etc. This script connects module
	to wifi router as per credentials in system.cfg file, creates hotspot on module and runs startup
	scripts.

3
File-name
	startup.lc
Description
	A script that is called by main script and runs all the programs in sequence as stated in
	startup.txt file.

4
File-name
	startup.txt
Description
	This file contains list of scripts to be run during the startup of module. The list should be in
	the same sequence as that of execution is required. User must be careful while deciding which script
	to be put here as it may cause endless loops if not done properly.
	
5
File-name
	system.cfg
Description
	System parameters and variables are stored in this file. The file is used during startup by main
	script. Do not change the contents of this file if you don't know what you're doing.
	
6
File-name
	readme.txt
Description
	This file...
	
7
File-name
	login.html
Description
	Local login screen page; available when module is running in server mode. This can be used for
	entering wifi router credentials using mobile.
	
8
File-name
	homepage.html
Description
	Homepage file which is used as a default webpage in local server mode by module.
	
9
File-name
	charger.lc
Description
	Battery charging monitoring program, uses P4 of the smartWIFI module for monitoring battery charging
	state using onboard LiPo charger.

* SYSTEM VARIABLES *
1 retVal - holds return values of utility outputs
2 deviceID - unique id of the wifi device / board
3 apSSID - ssid of wifi router to which module can connect by default upon startup
4 apPassword - password of wifi router for default connection
5 hotspotSSID - password of wifi hotspot created by module
6 hotspotPassword - password of wifi hotspot created by module
7 consoleLog - set as true / false, decides whether module utilities show detailed log of working
8 consoleOutput - set as true / false, decides whether module utilities display output values on screen
 
--- end of file
