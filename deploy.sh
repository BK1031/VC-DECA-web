#!/bin/sh
echo "Running flutter build"
flutter build web
echo "Deploying to mywb.vcs.net/deca"
scp -r build/web/* supadmin@mywb.vcs.net:~/www/vcdeca
echo "Deployment complete"
echo "Restarting server"
ssh supadmin@mywb.vcs.net 'source ./wb_commands.sh; mywb restart'