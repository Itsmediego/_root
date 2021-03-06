#!/bin/bash

i=$1

if [ "$i" = "clean" ]
then
	echo "Deleting all object files and binaries..."
	rm *.o
	rm *.elf
	rm *.bin
	rm *.*~
	exit
fi

if [ "$i" = "" ]
then 
	echo "The source files have been built..."
	echo -e "To copy files to sdcard \n Use: ./build.sh flash"
else
	echo "Action requested: $i"
	echo "Building all source files... and copying image into sdcard"
fi

 arm-none-eabi-gcc -mcpu=arm1176jzf-s -fpic -ffreestanding -c boot.S -o boot.o
 arm-none-eabi-gcc -mcpu=arm1176jzf-s -fpic -ffreestanding -std=gnu99 -c uart.c -o uart.o -O2 -Wall -Wextra
 arm-none-eabi-gcc -mcpu=arm1176jzf-s -fpic -ffreestanding -std=gnu99 -c base64.c -o base64.o -O2 -Wall -Wextra
 arm-none-eabi-gcc -mcpu=arm1176jzf-s -fpic -ffreestanding -std=gnu99 -c ascii_hex.c -o ascii_hex.o -O2 -Wall -Wextra
 arm-none-eabi-gcc -T linker.ld -o myos.elf -ffreestanding -O2 -nostdlib boot.o uart.o base64.o ascii_hex.o
 arm-none-eabi-objcopy myos.elf -O binary myos.bin

if [ "$i" = "flash" ]
then
	if [ -e /media/bhargav/boot/ ]
	then
		echo "sdcard present" 
	else
		echo -e "FIXME:\nsdcard not present or\npath of the sdcard/boot/ partition not correct"
		exit
	fi
	cp myos.bin /media/bhargav/boot/kernel.img
	ls -l  /media/bhargav/boot/kernel.img
	umount /media/bhargav/*
	sync
fi


