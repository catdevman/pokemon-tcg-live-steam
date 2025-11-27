#!/bin/bash

# 1. The Non-Steam Game AppID (Taken from your logs)
APPID="CHANGE TO YOUR APPID"

# 2. Path to your Proton installation (Adjust if you change Proton versions)
# Your logs showed you are using "Proton - Experimental"
PROTON_PATH="CHANGE TO YOUR PROTON VERSION PATH, YOU CAN FIND THIS IN STEAM BY GOING TO THE PROPERTIES OF YOUR PROTON VERSION AND THEN INSTALLED FILES AND BROWSE, CHANGE THIS VALUE TO THAT PATH IT GOES TO"

# 3. The Compatdata Folder (Where the fake C: drive lives)
COMPAT_PATH="$HOME/.local/share/Steam/steamapps/compatdata/$APPID"

# 4. Export necessary Wine variables so it knows where to look
export WINEPREFIX="$COMPAT_PATH/pfx"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.local/share/Steam"
export STEAM_COMPAT_DATA_PATH="$HOME/.local/share/Steam/steamapps/compatdata/$APPID"

# 5. Run the command using the specific Proton Wine binary
WINEFSYNC=1 "$PROTON_PATH/files/bin/wine64" start "$1"
