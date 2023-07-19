#!/bin/bash

tput setaf 2;
cat web/art/ajta.txt

tput setaf 1; echo "Before running this script, please make sure Docker is running and you have made changes to .env file."
tput setaf 2; echo "Changing the postgres username & password from .env is highly recommended."

tput setaf 4;
read -p "Are you sure, you made changes to .env file (y/n)? " answer
case ${answer:0:1} in
    y|Y|yes|YES|Yes )
      echo "Continiuing Installation!"
    ;;
    * )
      nano .env
    ;;
esac

echo " "
tput setaf 3;
echo "#########################################################################"
echo "Please note that, this installation script is only intended for Linux"
echo "#########################################################################"

echo " "
tput setaf 4;
echo "Installing ajta and it's dependencies"

echo " "
if [ "$EUID" -ne 0 ]
  then
  tput setaf 1; echo "Error installing ajta, Please run this script as root!"
  tput setaf 1; echo "Example: sudo ./install.sh"
  exit
fi

echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing curl..."
echo "#########################################################################"
if [ -x "$(command -v curl)" ]; then
  tput setaf 2; echo "CURL already installed, skipping."
else
  sudo apt update && sudo apt install curl -y
  tput setaf 2; echo "CURL installed!!!"
fi

echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing Docker..."
echo "#########################################################################"
if [ -x "$(command -v docker)" ]; then
  tput setaf 2; echo "Docker already installed, skipping."
else
  curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
  tput setaf 2; echo "Docker installed!!!"
fi


echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing make"
echo "#########################################################################"
if [ -x "$(command -v make)" ]; then
  tput setaf 2; echo "make already installed, skipping."
else
  apt install make
fi

echo " "
tput setaf 4;
echo "#########################################################################"
echo "Checking Docker status"
echo "#########################################################################"
if systemctl is-active docker >/dev/null 2>&1; then
  tput setaf 4;
  echo "Docker is running."
 elif service docker status > /dev/null 2>&1; then
  tput setaf 4;
  echo "Docker is running"
else
  tput setaf 1;
  echo "Docker is not running. Please run docker and try again."
  echo "You can run docker service using sudo systemctl start docker"
  exit 1
fi



echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing Ajta"
echo "#########################################################################"
make certs && make build && make up && tput setaf 2 && echo "Ajta is installed!!!" && failed=0 || failed=1

if [ "${failed}" -eq 0 ]; then
  sleep 3

  echo " "
  tput setaf 4;
  echo "#########################################################################"
  echo "Creating an account"
  echo "#########################################################################"
  make username

  tput setaf 2 && printf "\n%s\n" "Thank you for installing Ajta, happy recon!!"
else
  tput setaf 1 && printf "\n%s\n" "Ajta installation failed!!"
fi
