@echo off
if not exist ATL mkdir ATL
for /f %%i in ('magick convert tx_daed_azura_face.* -format %%w info:') do set resolutionW=%%i

magick convert tx_daed_azura_headthing.* tx_daed_azura_flowerpetal.* tx_daed_azura_ear.* -background "#3e3433" +append -gravity west ATL/az00.bmp
magick convert ATL/az00.bmp tx_daed_azura_hand.* -background "#3e3433" -append ATL/az001.bmp
magick convert ATL/az001.bmp tx_daed_azura_dress.* +append ATL/az1.bmp
magick convert tx_daed_azura_moon.* tx_daed_azura_sun.* +append ATL/az2.bmp

magick convert tx_daed_azura_face.* tx_daed_azura_torso.* ATL/az1.bmp ATL/az2.bmp -resize %resolutionW% -append -define dds:compression=dxt1 ATL/atlad_dae_stat_azura.dds

cd ATL
del az00.bmp
del az001.bmp
del az1.bmp
del az2.bmp
cd ..

if not defined run_without_pause pause