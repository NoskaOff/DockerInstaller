#!/bin/bash

echo This an installer for the latest version of Docker.
read -p "Have you run part 1? Y/N " answer

while true
do
  case $answer in
   [yY]* ) echo "This is the verification process. If it fails, did you logoff after part 1?"
           docker version
           docker run hello-world
           exit;;

   [nN]* ) sudo apt-get update && sudo apt-get upgrade
           curl -fsSL https://get.docker.com -o get-docker.sh
           sudo sh get-docker.sh
           sudo rm get-docker.sh
           sudo usermod -aG docker $USER
           echo "Installation complete."
           echo "Please logoff and login again for changes to apply then run this script to verify the installation."
           exit;;

   * )     echo "Answer Y or N or ctrl+c to quit"; break ;;
  esac
done
