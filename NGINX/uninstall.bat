@echo off
echo Stopping NGINX and Certbot containers and removing volumes...
docker-compose down -v
echo.
echo All containers and associated volumes have been removed.
pause
