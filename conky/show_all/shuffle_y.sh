#!/bin/bash

# Define the config file location
CONFIG_FILE="/home/francois/.config/conky/show_all/show_all_conf"

# Read the current alignment
alignment=$(grep "alignment" "$CONFIG_FILE" | awk -F "'" '{print $2}')

# Toggle between top and bottom
if [[ $alignment == *"top"* ]]; then
    new_alignment=$(echo $alignment | sed 's/top/bottom/')
else
    new_alignment=$(echo $alignment | sed 's/bottom/top/')
fi

# Replace the alignment in the config file
sed -i "s/alignment = '$alignment'/alignment = '$new_alignment'/" "$CONFIG_FILE"

echo "Alignment updated to $new_alignment"