@echo off
echo Starting NGINX and Certbot containers...
docker-compose up -d
echo.
echo Containers are running in the background.
pause
