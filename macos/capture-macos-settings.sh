#!/bin/bash

# Capture current macOS settings to recreate them later
# Usage: ./capture-macos-settings.sh > macos-settings.sh

echo "#!/bin/bash"
echo "# macOS Settings - Generated on $(date)"
echo ""

# Function to read and generate defaults write command
capture_setting() {
    local domain=$1
    local key=$2
    local value=$(defaults read "$domain" "$key" 2>/dev/null)
    
    if [ $? -eq 0 ]; then
        # Detect type and format accordingly
        if [[ "$value" == "1" ]] || [[ "$value" == "0" ]]; then
            # Boolean
            local bool_val="false"
            [ "$value" == "1" ] && bool_val="true"
            echo "defaults write $domain $key -bool $bool_val"
        elif [[ "$value" =~ ^[0-9]+$ ]]; then
            # Integer
            echo "defaults write $domain $key -int $value"
        elif [[ "$value" =~ ^[0-9]+\.[0-9]+$ ]]; then
            # Float
            echo "defaults write $domain $key -float $value"
        else
            # String (escape quotes)
            value=$(echo "$value" | sed 's/"/\\"/g')
            echo "defaults write $domain $key \"$value\""
        fi
    fi
}

echo "# Finder Settings"
capture_setting com.apple.finder ShowExternalHardDrivesOnDesktop
capture_setting com.apple.finder ShowRemovableMediaOnDesktop
capture_setting com.apple.finder ShowHardDrivesOnDesktop
capture_setting com.apple.finder ShowMountedServersOnDesktop
capture_setting com.apple.finder AppleShowAllFiles
capture_setting com.apple.finder ShowPathbar
capture_setting com.apple.finder ShowStatusBar
capture_setting com.apple.finder FXDefaultSearchScope
capture_setting com.apple.finder FXPreferredViewStyle

echo ""
echo "# Dock Settings"
capture_setting com.apple.dock autohide
capture_setting com.apple.dock tilesize
capture_setting com.apple.dock orientation
capture_setting com.apple.dock show-recents
capture_setting com.apple.dock minimize-to-application

echo ""
echo "# Trackpad Settings"
capture_setting com.apple.AppleMultitouchTrackpad Clicking
capture_setting com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking
capture_setting com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag

echo ""
echo "# Keyboard Settings"
capture_setting NSGlobalDomain KeyRepeat
capture_setting NSGlobalDomain InitialKeyRepeat
capture_setting NSGlobalDomain ApplePressAndHoldEnabled

echo ""
echo "# Screenshots"
capture_setting com.apple.screencapture location
capture_setting com.apple.screencapture type
capture_setting com.apple.screencapture disable-shadow

echo ""
echo "# Menu Bar"
capture_setting com.apple.menuextra.clock DateFormat

echo ""
echo "# Hot Corners (if set)"
capture_setting com.apple.dock wvous-tl-corner
capture_setting com.apple.dock wvous-tr-corner
capture_setting com.apple.dock wvous-bl-corner
capture_setting com.apple.dock wvous-br-corner

echo ""
echo "# Restart affected applications"
echo "killall Finder"
echo "killall Dock"
echo "killall SystemUIServer"