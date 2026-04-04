#!/bin/bash

# Script to cycle through main audio devices

# IEM, Headset, Bookshelf speakers sink names
iem="alsa_output.usb-Apple__Inc._USB-C_to_3.5mm_Headphone_Jack_Adapter_DWH3343037AJKLTA3-00.analog-stereo"
headset="alsa_output.usb-Kingston_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo"
speaker="alsa_output.usb-Generic_USB_Audio-00.HiFi__Speaker__sink"

devices=("$iem" "$headset" "$speaker")

# Map names via dictionary for notification
declare -A hardware_names
hardware_names["$iem"]="Truthear Hexa - IEM"
hardware_names["$headset"]="HyperX Cloud II - Headset"
hardware_names["$speaker"]="Fluance Ai41 - Speaker"

# Get the current sink name
current=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep "node.name" | cut -d '"' -f 2)

# Find the next device in the array
next_name=${devices[0]} # Fallback device
for i in "${!devices[@]}"; do
   if [[ "${devices[$i]}" == "$current" ]]; then
      next_index=$(( (i + 1) % ${#devices[@]} ))
      next_name=${devices[$next_index]}
      break
   fi
done

# Find sink ID of next_name
target_id=$(wpctl status -n | grep -F "$next_name" | grep -oP '\d+(?=\.)' | head -n 1)

if [ -n "$target_id" ]; then
   wpctl set-default "$target_id"

   # Grab hardware interface name
   # device_name=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep "node.description" | cut -d '"' -f 2)

   # Grab audio device name
   device_name=${hardware_names[$next_name]:-"Unknown Device"}
   
   notify-send -u low -a "System" -i audio-speakers "Audio Output Switch" "Active: $device_name" -t 500
else
   notify-send -a "System" "Audio Switch Error" "Could not find sink ID for $next_name"
fi