SET serviceName=AOS60$01
SET aosHost=WIN-P9ATRJET6GT
SET aosPort=2712
SET appPath="C:\Program Files (x86)\Microsoft Dynamics AX\60\Client\Bin\AX32.exe"

:: 1) Restart the AOS service
net stop %serviceName%
net start %serviceName%

:: 2) Perform a full system compile
::%appPath% -aos2=%aosHost%:%aosPort% -startupcmd=CompileAll_+ -lazytableloading -lazyclassloading

:: 3) Perform a full CIL compile
::%appPath% -aos2=%aosHost%:%aosPort% -startupcmd=CompileIl -lazytableloading -lazyclassloading

:: 4) Perform sync db
%appPath% -aos2=%aosHost%:%aosPort% -startupcmd=Synchronize

:: 5) Restart the AOS service
net stop %serviceName%
net start %serviceName%