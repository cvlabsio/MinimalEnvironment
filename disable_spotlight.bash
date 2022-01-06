#!/bin/bash

OS="$(uname -s)"

if [ $OS = "Darwin" ]; then
	echo "Darwin"

	for myed in $(mount | grep "on /Volumes/" | awk '{print $3}'); do
		if [ ! -f ${myed}/.metadata_never_index ]; then
			touch ${myed}/.metadata_never_index
		else
			echo "spotlight already disabled on ${myed}"
		fi
	done

fi
