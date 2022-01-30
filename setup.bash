#!/bin/bash

SETUPS="ubuntu brew repos ssh python tmux vim aws ohmyzsh"

for SETUP in $SETUPS; do
	echo ${SETUP}
	printf "\n\n"
	./setup_${SETUP}.bash
done
