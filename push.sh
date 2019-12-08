#!/bin/bash

reset="\033[0m"
red="\033[31m"
green="\033[32m"
cyan="\033[36m"

sp()
{
pid=$!
spin=' /-|-\'
i=0
while kill -0 $pid 2>/dev/null
do
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  sleep .1
done
}

config()
{
  printf "$cyan$ git config user.email $reset\n"
  read -p "email: " email
  sp && git config user.email "$email"
  printf "$cyan$ git config user.name $reset\n"
  read -p "name: " name
  sp && git config user.name "$name"
  clear
}

#config

printf "$cyan$ git pull $reset\n"
sleep 2 & sp
git pull
printf "$green[ok]$reset\n"

printf "$cyan$ git status $reset\n"
sleep 2 & sp
git status
printf "$green[ok]$reset\n"

printf "$cyan$ git add .$reset\n"
sleep 2 & sp
git add .
printf "$green[ok]$reset\n"

printf "$cyan$ git status $reset\n"
sleep 2 & sp
git status
printf "$green[ok]$reset\n"

printf "$cyan$ git commit $reset\n"
read -p "commit message: " message
sleep 2 & sp
git commit -m "$message"
printf "$green[ok]$reset\n"

printf "$cyan$ git status $reset\n"
sleep 2 & sp
git status
printf "$green[ok]$reset\n"

printf "$cyan$ git push $reset\n"
sleep 2 & sp
git push
printf "$green[ok]$reset\n"

exit;
