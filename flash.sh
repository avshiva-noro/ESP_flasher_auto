#!/usr/bin/bash
#right now only for linux/unix
if [[ $EUID != 0 ]];
then
    echo "Error access denied user not ROOT"
    exit
fi

if [[ $1 = $false ]] && [[ $2 = $false ]];
then
    echo "           Do it in a order given below"
    echo "(First) Enter a flash/bin file [ example ~/firmware.bin ]"
    echo "(Second) Enter the port [ example /dev/ttyUSB0 ]"
else
    python3 esptool.py --port $2 erase_flash
    python3 esptool.py --port $2 write_flash -fs detect 0 $1
    
fi


