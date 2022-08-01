@echo off

@REM create place to store save/ scripts/ setting.xml etc...
set DATA_DIR=%CD%/data
echo DATA_DIR=%DATA_DIR%

set USE_STEAM=false
echo USE_STEAM=%USE_STEAM%

@REM set exe
@REM set EXECUTABLE="/d/SteamLibrary/steamapps/common/Stationeers Dedicated Server/rocketstation_DedicatedServer.exe"
set EXECUTABLE="C:\Users\Brogan\Documents\Unity\stationeers\Builds\Server_Win\rocketstation.exe"

echo EXECUTABLE=%EXECUTABLE%

@REM --- Run Stationeers ---

@REM # Define settings
set SERVER_NAME="Brogan Test Dedi Server"
set SAVE_NAME="Dedi Test"
set WORLD_TYPE="mars"
set SERVER_PASSWORD="123"
set GAME_PORT=27016
set START_LOCAL_HOST=true
set SERVER_VISIBLE=true
set UPNP_ENABLED=false
set SERVER_MAX_PLAYERS=13
set AUTO_SAVE=true
set SAVE_INTERVAL=60
set SAVE_PATH="%DATA_DIR%/saves"
set LOG_FILE="%DATA_DIR%/log.txt"
set SETTINGS_PATH="%DATA_DIR%/settings.xml"

echo SAVE_PATH=%SAVE_PATH%
echo LOG_FILE=%LOG_FILE%
echo SETTINGS_PATH=%SETTINGS_PATH%

@REM Run the server
%EXECUTABLE% ^
-loadlatest %SAVE_NAME% %WORLD_TYPE% ^
@REM -logFile %LOG_FILE% ^
-settingspath %SETTINGS_PATH% ^
-settings StartLocalHost %START_LOCAL_HOST% ServerVisible %SERVER_VISIBLE% ^
    GamePort %GAME_PORT% UPNPEnabled %UPNP_ENABLED% ServerName %SERVER_NAME% ^
    ServerPassword %SERVER_PASSWORD% ServerMaxPlayers %SERVER_MAX_PLAYERS% ^
    AutoSave %AUTO_SAVE% SaveInterval %SAVE_INTERVAL% ^
    SavePath %SAVE_PATH%