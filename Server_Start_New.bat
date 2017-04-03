timeout 5

::Start Dayz Server::

start "arma2" /HIGH /affinity 2  "arma2oaserver.exe" -ip=78.31.67.100 -port=3300 -maxmem=2047 -noPause "-config=instance_11_Chernarus\config.cfg" "-cfg=instance_11_Chernarus\basic.cfg" "-profiles=instance_11_Chernarus" -name=instance_11_Chernarus "-mod=@DayZ_Epoch;@DayZ_Epoch_Server;"

cls

@exit