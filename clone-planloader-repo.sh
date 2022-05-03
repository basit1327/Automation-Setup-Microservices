#!/bin/sh

#Exit if any command failed
set -e


AuthService="master"
RouterService="master"
UserService="master"
LocationService="master-v2"
TaskActivityService="master"
AccountService="master"
ProjectService="master"
MessagingService="master"
PubnubService="master"
NotificationService="master"
BoardService="master"
SwaggerService="master"
ConfigListenerService="master"


# Cloning Auth Service
git clone -b $AuthService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-auth-service
cd planloader-auth-service
npm install
cd ..

# Cloning Router Service
git clone -b $RouterService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/Planloader-API-gateway
cd Planloader-API-gateway
npm install
cd ..

# Cloning User Service
git clone -b $UserService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-user-service
cd planloader-user-service
npm install
cd ..

# Cloning Location Service
git clone -b $LocationService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-web-location-service
cd planloader-web-location-service
npm install
cd ..

# Cloning Task Activity Service
git clone -b $TaskActivityService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/Planloader-task-activity-service
cd Planloader-task-activity-service
npm install
cd ..

# Cloning Account Service
git clone -b $AccountService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-accounts-service
cd planloader-accounts-service
npm install
cd ..

# Cloning Project Service
git clone -b $ProjectService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-projects-service
cd planloader-projects-service
npm install
cd ..

# Cloning Board Messaging Service
git clone -b $MessagingService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-board-messaging-service
cd planloader-board-messaging-service
npm install
cd ..

# Cloning Pubnub Service
git clone -b $PubnubService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-pubnub-subscription-service
cd planloader-pubnub-subscription-service
npm install
cd ..

# Cloning Board Service
git clone -b $BoardService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-boards-service
cd planloader-boards-service
npm install
cd ..

# Cloning Notification Service
git clone -b $NotificationService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-notification-service
cd planloader-notification-service
npm install
cd ..

# Cloning Swagger Service
git clone -b $SwaggerService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/planloader-swagger
cd planloader-swagger
npm install
cd ..

# Cloning Config Listener Service
git clone -b $ConfigListenerService git@ssh.dev.azure.com:v3/GagaMuller/PlanLoader/PlaLoader-ConfigListener
cd PlaLoader-ConfigListener
npm install
echo 'All planlaoder services are cloned'
echo 'Starting Config Listener services with PM2'
pm2 restart ecosystem.config.js

echo 'All Done!'


# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
