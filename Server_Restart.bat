@echo off
echo.
echo KILL arma2oaserver.exe
set serverkill="C:\Users\Administrator\Desktop\epoch"
cd /d %serverkill%
taskkill /im arma2oaserver.exe
echo.
echo Kill Bec.exe
set beckill="C:\Users\Administrator\Desktop\epoch\instance_11_Chernarus\BattlEye\Bec"
cd /d %beckill%
taskkill /im bec.exe

timeout 5

echo.
echo Rotate Logs
start "start" "C:\Users\Administrator\Desktop\epoch\instance_11_Chernarus\rotate_logs.bat" 

timeout 5


echo.
echo Starting Dayz Server
:: start the server..
set dayzpath="C:\Users\Administrator\Desktop\epoch\"
cd /d %dayzpath%
start "start" "Server_Start_New.bat"
echo.
echo Starting Bec
timeout 20
:: start bec
set becpath="C:\Users\Administrator\Desktop\epoch\instance_11_Chernarus\BattlEye\Bec"
cd /d %becpath%
start "start" "bec.exe" -f Config.cfg
echo.
echo Server Started 100%

cls
@exit