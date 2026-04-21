@echo off
chcp 65001 >nul
echo ================================================
echo    아이템매니아 자동 재등록 - 설치
echo ================================================
echo.

:: Check Python
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [1/4] Python이 없습니다. 설치 중...
    curl -o python_installer.exe https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe
    python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
    del python_installer.exe
    echo Python 설치 완료!
    echo.
) else (
    echo [1/4] Python 이미 설치됨. 건너뜀...
    echo.
)

echo [2/4] 패키지 설치 중...
pip install playwright websockets
echo.

echo [3/4] Chromium 브라우저 설치 중...
playwright install chromium
echo.

echo [4/4] 설치 완료!
echo.
echo ================================================
echo  이제 auto_click.exe 를 실행하세요!
echo ================================================
echo.
pause