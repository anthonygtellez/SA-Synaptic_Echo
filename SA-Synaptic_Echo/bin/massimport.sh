#!/bin/sh
for fileimport in $(< $1); do
	echo ""
	echo ""
	echo "parsing $fileimport"
	echo ""
	python_command="python iocp.py ${fileimport}"
	$python_command
	echo "$python_command"
done

