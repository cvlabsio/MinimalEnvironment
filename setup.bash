#!/bin/bash

SETUPS="brew repos ssh python tmux vim ohmyzsh"

for SETUP in $SETUPS; do
	echo ${SETUP}
	printf "\n\n"
	./setup_${SETUP}.bash
done
