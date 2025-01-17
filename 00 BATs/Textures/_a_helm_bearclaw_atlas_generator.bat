@echo off
if not exist ATL mkdir ATL
for /f %%i in ('magick convert tx_helm_bearclaw00.dds -format %%w info:') do set resolutionW=%%i

magick convert tx_helm_bearclaw01.dds tx_helm_bearclaw01.dds -append ATL/temp1.bmp
magick convert ATL/temp1.bmp ATL/temp1.bmp tx_helm_bearclaw02.dds +append ATL/temp2.bmp

magick convert tx_helm_bearclaw00.dds ATL/temp2.bmp -resize %resolutionW% -append -define dds:compression=dxt1 ATL/atlad_a_helm_bearclaw.dds

cd ATL
del temp1.bmp
del temp2.bmp
cd ..

if not defined run_without_pause pause
