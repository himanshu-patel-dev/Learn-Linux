#!/bin/bash
# Program to output a system information page
TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIMESTAMP="Generated $CURRENT_TIME, by $USER"

report_uptime () {
	cat <<- __EOF__
		<H2>System Uptime</H2>
		<PRE>$(uptime)</PRE>
	__EOF__
	return
}

report_disk_space () {
	cat <<- __EOF__
		<H2>Disk Space Utilization</H2>
		<PRE>$(df -h)</PRE>
	__EOF__
	return
}

report_home_space () {
	cat <<- __EOF__
		<H2>Home Space Utilization</H2>
		<PRE>$(du -sh /home/*)</PRE>
	__EOF__
	return
}

cat << _EOF_
	<HTML>
	<HEAD>
		<TITLE>$TITLE</TITLE>
	</HEAD>
	<BODY>
		<H1>$TITLE</H1>
		<P>$TIMESTAMP</P>
		$(report_uptime)
		$(report_disk_space)
		$(report_home_space)
	</BODY>
	</HTML>
_EOF_