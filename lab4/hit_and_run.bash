#!/bin/bash

doas pacman -Syu > /dev/null

if pacman -Qs $1 > /dev/null ; then
  echo $1 is installed
else
  echo $1 is not installed
  echo Installing $1
  doas pacman -S --noconfirm $1 > /dev/null
fi

for (( i=0; i <$2; i++ ))
do
  xterm -e $1& 
done

sleep $3

killall xterm

echo -n "Uninstall $1? (y/N)"
read val

if [[ "$val" == "y" ]]
then
  echo Uninstalling $1
  doas pacman -R -s --noconfirm $1 > /dev/null
fi
