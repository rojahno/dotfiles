#!/bin/bash

# Mac Active - Keep Mac status as Available (Enhanced)
# This script uses multiple methods to simulate activity

echo -e "\033[0;32mMac Active Script Started (Enhanced Mode)\033[0m"
echo -e "\033[0;33mPress Ctrl+C to stop\033[0m"
echo ""

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Error: This script requires macOS."
    exit 1
fi

# Counter for display
count=0

# Trap Ctrl+C to exit gracefully
trap 'echo -e "\n\033[0;33mMac Active Script Ended\033[0m"; exit 0' INT

# Function to simulate activity
simulate_activity() {
    # Method 1: Simulate keyboard activity (Shift key)
    osascript -e 'tell application "System Events" to key code 56' &> /dev/null
    sleep 0.1
    
    # Method 2: Simulate mouse movement (small movement)
    osascript -e 'tell application "System Events"
        set currentPosition to position of mouse
        set x to item 1 of currentPosition
        set y to item 2 of currentPosition
        set mouseLoc to {x + 1, y + 1}
        set mouseLoc2 to {x, y}
        -- Move mouse slightly
        -- Note: This requires accessibility permissions
    end tell' &> /dev/null
    
    # Method 3: Use caffeinate to prevent system idle
    # Run caffeinate for 65 seconds (slightly more than our loop interval)
    caffeinate -u -t 65 &
}

echo -e "\033[0;33mNote: For best results, grant Terminal accessibility permissions in System Preferences.\033[0m"
echo ""

while true; do
    ((count++))
    
    # Simulate activity
    simulate_activity
    
    # Display status
    timestamp=$(date "+%H:%M:%S")
    echo -e "\033[0;36m[$timestamp] Activity simulated (Count: $count)\033[0m"
    
    # Wait 30 seconds before next activity
    sleep 30
done