@echo off
cls
COLOR b
echo ------------------------------------------------------------------------
echo ! 8888888b.  d8b 888b    888           .d8888b.           8888888b.  
echo ! 888  "Y88b Y8P 8888b   888          d88P  Y88b          888   Y88b 
echo ! 888    888     88888b  888          Y88b.               888    888 
echo ! 888    888 888 888Y88b 888  8888b.   "Y888b.    .d88b.  888   d88P 
echo ! 888    888 888 888 Y88b888     "88b     "Y88b. d88""88b 8888888P"  
echo ! 888    888 888 888  Y88888 .d888888       "888 888  888 888 T88b   
echo ! 888  .d88P 888 888   Y8888 888  888 Y88b  d88P Y88..88P 888  T88b  
echo ! 8888888P"  888 888    Y888 "Y888888  "Y8888P"   "Y88P"  888   T88b
echo ------------------------------------------------------------------------
echo ! https://github.com/DiNaSoR/all2chd
echo ! Code by : Salah Alrashidi (Kuwait)
echo ------------------------------------------------------------------------
set "CHDMAN=%~dp0chdman.exe"
for /r %%i in (*.cue, *.gdi, *.iso, *.zip) do (
    if /i "%%~xi"==".zip" (
        echo Extracting "%%i"
        mkdir "%%~ni"
        7z x "%%i" -o"%%~ni"
        pushd "%%~ni"
        for %%j in (*.cue, *.gdi, *.iso) do (
            if not exist "%%~dpnij.chd" (
                echo Converting "%%j" to "%%~dpni.chd"
                "%CHDMAN%" createcd -i "%%j" -o "%%~dpni.chd"
            ) else (
                echo Skipping "%%j", output file "%%~dpni.chd" already exists
            )
        )
        popd
        rmdir /s /q "%%~ni"
        del "%%i"
    ) else (
        if not exist "%%~ni.chd" (
            echo Converting "%%i" to "%%~ni.chd"
            "%CHDMAN%" createcd -i "%%i" -o "%%~ni.chd"
        ) else (
            echo Skipping "%%i", output file "%%~ni.chd" already exists
        )
    )
)
pause
