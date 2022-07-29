#!/bin/bash

# create place to store save/ scripts/ setting.xml etc...
DATA_DIR="${PWD}/data"
echo "DATA_DIR=${DATA_DIR}"

USE_STEAM=false # will point exe to steam location instead of unity build dir
echo "USE_STEAM=${USE_STEAM}"

# home locations
HOME_LINUX="/home/brogan"
HOME_WIN="C:/Users/Brogan/Documents"

# os check
echo "OSTYPE=${OSTYPE}"
IS_WINDOWS=true
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    IS_WINDOWS=false
fi
echo "IS_WINDOWS=${IS_WINDOWS}"

# set home
HOME=""
if $IS_WINDOWS; then
    HOME=$HOME_WIN
else 
    HOME=$HOME_LINUX
fi
echo "HOME=${HOME}"

#get exe location
EXECUTABLE_STEAM_LINUX="$HOME/.steam/debian-installation/steamapps/common/Stationeers Dedicated Server/rocketstation_DedicatedServer.x86_64"
EXECUTABLE_STEAM_WIN="/d/SteamLibrary/steamapps/common/Stationeers Dedicated Server/rocketstation_DedicatedServer.exe"

EXECUTABLE_UNITY_LINUX="$HOME/Unity/stationeers/Builds/LinuxServer/rocketstation.x86_64"
EXECUTABLE_UNITY_WIN="$HOME/Unity/stationeers/Builds/Server_Win/rocketstation.exe"

# set exe
EXECUTABLE=""
if $USE_STEAM; then
    if $IS_WINDOWS; then
        EXECUTABLE="$EXECUTABLE_STEAM_WIN"
    else
        EXECUTABLE="$EXECUTABLE_STEAM_LINUX"
    fi
else
    if $IS_WINDOWS; then
        EXECUTABLE="$EXECUTABLE_UNITY_WIN"
    else
        EXECUTABLE="$EXECUTABLE_UNITY_LINUX"
    fi
fi
echo "EXECUTABLE=${EXECUTABLE}"

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

echo "SAVE_PATH=${SAVE_PATH}"
echo "LOG_FILE=${LOG_FILE}"
echo "SETTINGS_PATH=${SETTINGS_PATH}"

# Run the server
"$EXECUTABLE" \
-loadlatest "$SAVE_NAME" $WORLD_TYPE \
# -logFile "$LOG_FILE" \
-settingspath "$SETTINGS_PATH" \
-settings StartLocalHost $START_LOCAL_HOST ServerVisible $SERVER_VISIBLE \
    GamePort $GAME_PORT UPNPEnabled $UPNP_ENABLED ServerName "$SERVER_NAME" \
    ServerPassword "$SERVER_PASSWORD" ServerMaxPlayers $SERVER_MAX_PLAYERS \
    AutoSave $AUTO_SAVE SaveInterval $SAVE_INTERVAL \
    SavePath "$SAVE_PATH"