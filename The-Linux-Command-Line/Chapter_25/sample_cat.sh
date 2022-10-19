#!/bin/bash
# Program to output a system information page
TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIMESTAMP="Generated $CURRENT_TIME, by $USER"
cat << _EOF_
<HTML>
	<HEAD>
	</HEAD>
	<BODY>
	<TITLE>$TITLE</TITLE>
	<H1>$TITLE</H1>
	<P>$TIMESTAMP</P>
	</BODY>
</HTML>
_EOF_