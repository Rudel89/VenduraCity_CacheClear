@echo off
setlocal


chcp 65001


set "expectedName=VenduraCity CacheClear.exe"
for %%F in ("%~nx0") do if /i not "%%~nxF"=="%expectedName%" (
    color 0C
    echo Fehler: Der Dateiname wurde geändert. Skript wird beendet.
    pause
    exit /b
)


set "fivemPath=%LocalAppData%\FiveM\FiveM.app\data"


if exist "%fivemPath%" (
    color 0A
    echo FiveM-Datenordner gefunden: %fivemPath%
    

    for %%d in (cache server-cache server-cache-priv) do (
        if exist "%fivemPath%\%%d" (
            echo Lösche %%d...
            rd /s /q "%fivemPath%\%%d"
        ) else (
            color 0C
            echo Ordner %%d nicht gefunden.
            color 0A
        )
    )
    chcp 1252
    color 0A
    echo        Alle angegebenen Ordner wurden gelöscht.
    echo -----------------------------------------------------------
    echo Vendura City Team wünscht dir viel Spaß auf unserem Server!
    ehco
    echo      Wenn du noch nciht auf unseren discord bist
    echo   einfach STRG + linke Maustaste auf den Discord-Link 
    echo ...........................................................
    echo ===========================================================
    echo      Discord-Link: https://discord.gg/JqvtfXM9PT
    echo ===========================================================
) else (
    color 0C
    echo Der Ordner %fivemPath% wurde nicht gefunden.
    echo Bitte überprüfe den Installationspfad von FiveM.
)

pause
