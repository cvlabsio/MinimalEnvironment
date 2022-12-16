#!/bin/bash

SETUPS="minimal_brew python tmux vim ohmyzsh"

for SETUP in $SETUPS; do
	echo ${SETUP}
	printf "\n\n"
	./setup_${SETUP}.bash
done
