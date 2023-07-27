@echo off
set "appInstaller=MeuApp.exe"
set "installParams=/quiet /norestart"

echo Instalando %appInstaller%...

REM Verifica se o arquivo de instalação do aplicativo existe
if not exist "%appInstaller%" (
    echo Arquivo %appInstaller% não encontrado.
    pause
    exit /b
)

REM Inicia a instalação silenciosa
start /wait "" "%appInstaller%" %installParams%

REM Verifica o código de retorno do comando de instalação
if %errorlevel% equ 0 (
    echo Instalação concluída com sucesso.
) else (
    echo Houve um erro durante a instalação.
)

pause
