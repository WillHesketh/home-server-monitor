================================================================================
Home Server Temperature Monitor
================================================================================
Temperature monitoring system for a home server (repurposed gaming PC
running CasaOS on Ubuntu/Debian).
 
--------------------------------------------------------------------------------
WHAT IT DOES
--------------------------------------------------------------------------------
- Reads CPU, GPU, iGPU (integrated Graphics), and RAM temperatures from hardware sensors
- Sends notifcations to users phone using Slack if temps exceed warning thresholds, using a webhook
- Automatically shuts down the server if temps hit critical levels
- Runs automatically every 5 minutes with cron
 
--------------------------------------------------------------------------------
SERVER
--------------------------------------------------------------------------------
  Local IP:     192.168.1.232
  Tailscale IP: 100.110.22.93
  OS:           Ubuntu/Debian under CasaOS
 
--------------------------------------------------------------------------------
HARDWARE SENSORS
--------------------------------------------------------------------------------
  CPU:   k10temp (Tctl)
  GPU:   NVIDIA GTX 1070 via nvidia-smi
  iGPU:  AMD Raphael via amdgpu (edge)
  RAM:   spd5118-i2c-7-51
 
--------------------------------------------------------------------------------
TEMPERATURE THRESHOLDS
--------------------------------------------------------------------------------
  CPU:   warn at 80°C, shutdown at 90°C
  GPU:   warn at 85°C, shutdown at 95°C
  iGPU:  warn at 75°C, shutdown at 85°C
  RAM:   warn at 55°C, shutdown at 65°C
 
--------------------------------------------------------------------------------
FILES
--------------------------------------------------------------------------------
  ~/tempsV1.sh     — reads temps
  ~/tempsNotifications.sh	- if temps are high, warns user, if they become 
  critical shuts system down
  ~/server.py    — Flask API serving live temps as JSON on port 8888
 
--------------------------------------------------------------------------------
API
--------------------------------------------------------------------------------
  http://192.168.1.232:8888/temps
  Returns: {"CPU":"38.8","GPU":"32","iGPU":"37.0","RAM":"27.2"}
 
 
--------------------------------------------------------------------------------
Problem to fix
--------------------------------------------------------------------------------
  With my new home server, What happens if a part is working too hard and
  overheats?
  I wouldn't of had an idea if anything bad was happening so I found a solution

--------------------------------------------------------------------------------
Solution
--------------------------------------------------------------------------------
  I decided to write a program, using AI to teach mehow to send a 
  notification to my phone using a webhook and an app called Slack
  
--------------------------------------------------------------------------------
Difficulties
--------------------------------------------------------------------------------
   - I had a lot of trouble with the coding aspect, as I had never coded in Bash]
  before, but I used AI to help me refer different peices of code to languages
  I do know a little about (At this time C++ and Java)
   - I had a lot of trouble learning how to seperate the different peices of
   the information given to me, into something that is just the number and can
   be used/displayed
   
--------------------------------------------------------------------------------
Reflection
--------------------------------------------------------------------------------
  This small project has exposed me to a world of computers that I had no idea
  existed. It has been extremely helpful in teaching me, not just how to code
  but also a new way of problem solving where, unlike highschool, its completely
  viable to use AI to aid; however, there is an extremely fine line with AI
  aiding you, and AI doing the whole project. I explored this line throughout
  this experience and I'm almost certain, its something that needs to be managed
  well and its something to be careful about.
  
--------------------------------------------------------------------------------
Whats next?
--------------------------------------------------------------------------------
  Now I have a way to be able to extract the neccessary data off my home server,
  I am going to create a nice UI that displays the information given to it nicely.
================================================================================

