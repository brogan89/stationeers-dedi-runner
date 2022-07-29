#!/bin/bash

IS_WINDOWS=false
USE_STEAM=true # will point exe to steam location instead of unity build dir

# home locations
HOME_LINUX="/home/brogan"
HOME_WIN="C:/Users/Brogan/Documents"

#get exe location
EXECUTABLE_STEAM="$HOME/.steam/debian-installation/steamapps/common/Stationeers Dedicated Server/rocketstation_DedicatedServer.x86_64"
EXECUTABLE_UNITY="$HOME/Unity/stationeers/Builds/LinuxServer/rocketstation.x86_64"

# create place to store save/ scripts/ setting.xml etc...
DATA_DIR="$HOME/stationeers-server/data"

# os check
echo "$OSTYPE"
if [[ "$OSTYPE" != "win32" ]]; then
    IS_WINDOWS=true
fi

# set home
HOME="/home/brogan"
if $IS_WINDOWS; then
    HOME="C:/Users/Brogan/Documents"
fi

# set exe
EXECUTABLE=$EXECUTABLE_UNITY
if $USE_STEAM; then
    EXECUTABLE=$EXECUTABLE_STEAM
fi

# --- Run Stationeers --- #

# Define settings
SERVER_NAME="Brogan Test Dedi Server"
SAVE_NAME="Dedi Test"
WORLD_TYPE="mars"
SERVER_PASSWORD="123"
GAME_PORT=27016
START_LOCAL_HOST=true
SERVER_VISIBLE=true
UPNP_ENABLED=false
SERVER_MAX_PLAYERS=13
AUTO_SAVE=true
SAVE_INTERVAL=60
SAVE_PATH="$DATA_DIR/saves"
LOG_FILE="$DATA_DIR/log.txt"
SETTINGS_PATH="$DATA_DIR/settings.xml"

# Run the server
"$EXECUTABLE" \
-loadlatest "$SAVE_NAME" $WORLD_TYPE \
-logFile "$LOG_FILE" \
-settingspath "$SETTINGS_PATH" \
-settings StartLocalHost $START_LOCAL_HOST ServerVisible $SERVER_VISIBLE \
    GamePort $GAME_PORT UPNPEnabled $UPNP_ENABLED ServerName "$SERVER_NAME" \
    ServerPassword "$SERVER_PASSWORD" ServerMaxPlayers $SERVER_MAX_PLAYERS \
    AutoSave $AUTO_SAVE SaveInterval $SAVE_INTERVAL \
    SavePath "$SAVE_PATH"



