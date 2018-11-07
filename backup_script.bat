@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

XCOPY "c:\Minecraft\world\*" "c:\minecraft\backups\world_backup_%fullstamp%" /i /s

cd "C:\minecraft\backups\world_backup_%fullstamp%"
"C:\Program Files\7-Zip\7z.exe" a -r -tzip "c:\minecraft\backups\world_backup_%fullstamp%.zip"
cd ..\..
rmdir "c:\minecraft\backups\world_backup_%fullstamp%\" /S /Q