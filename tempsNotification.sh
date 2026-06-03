#!/bin/bash
WEBHOOK=source ~/TempDashboard/config.sh

cpuLimit=80
gpuLimit=85
igcpuLimit=75
ramLimit=55

CPU=$(sensors | grep 'Tctl' | awk '{print $2}' | tr -d '+°C' | cut -d'.' -f1)
GPU=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
igCPU=$(sensors | grep 'edge' | awk '{print $2}' | tr -d '+°C' | cut -d'.' -f1)
RAM=$(sensors | grep -A5 'spd5118-i2c-7-51' | grep 'temp1' | awk '{print $2}' | tr -d '+°C' | cut -d'.' -f1)

if [[ $CPU -gt $cpuLimit ]]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"!ALERT! CPU OVERHEAT"}' $WEBHOOK
fi
if [[ $GPU -gt $gpuLimit ]]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"!ALERT! GPU OVERHEAT"}' $WEBHOOK
fi
if [[ $igCPU -gt $igcpuLimit ]]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"!ALERT! igCPU OVERHEAT"}' $WEBHOOK
fi
if [[ $RAM -gt $ramLimit ]]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"!ALERT! RAM OVERHEAT"}' $WEBHOOK
fi

if [[ $CPU -gt $((cpuLimit+10)) ]]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"!ALERT! EMERGENCY SHUTDOWN"}' $WEBHOOK
	sudo shutdown now
fi
if [[ $GPU -gt $((gpuLimit+10)) ]]; then
	curl -X POST -H 'Content-type: application/json' --data '{"text":"!ALERT! EMERGENCY SHUTDOWN"}' $WEBHOOK1~
	sudo shutdown now
fi
if [[ $igCPU -gt $((igcpuLimit+10)) ]]; then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"!ALERT! EMERGENCY SHUTDOWN"}' $WEBHOOK
	sudo shutdown now
fi
if [[ $RAM -gt $((ramLimit+10)) ]]; then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"!ALERT! EMERGENCY SHUTDOWN"}' $WEBHOOK
	sudo shutdown now
fi
