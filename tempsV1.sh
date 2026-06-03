#!/bin/bash
echo "---- TEMPERATURES ----"
echo "|                     |"
echo "|CPU: $(sensors |grep 'Tctl' | awk '{print $2}')         |"
echo "|GPU: +$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)°C           |"
echo "|CPU(IG): $(sensors |grep 'edge' | awk '{print $2}')     |"
echo "|RAM: $(sensors |grep -A5 'spd5118-i2c-7-51' | grep 'temp1' | awk '{print $2}')         |"
echo "|                     |"
echo "----------------------"
