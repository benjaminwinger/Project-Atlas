@echo off
if not exist ATL mkdir ATL
for /f %%i in ('magick convert tx_cuirass_ebon00.dds -format %%w info:') do set resolutionW=%%i

magick convert tx_cuirass_ebon00.dds tx_cuirass_ebon01.dds -resize %resolutionW% +append -define dds:compression=dxt1 ATL/atlad_a_cuirass_ebon.dds

if not defined run_without_pause pause
