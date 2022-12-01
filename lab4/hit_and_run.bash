#!/bin/bash



if #$1
then
  echo "Installning $1"
#uppdatera installerade paket
#installera $1
fi
echo "$1 installed"
echo "Running $2 processes of $1 for $3 seconds in xterm"
for #(( $2 antal processer ))
do
  #Kör programmet i ett xterm -fönster som bakgrundsprocess
done
sleep $3
#döda alla xterm -processer
echo -n "Uninstall $1? (y/n)"
read val
if [[ "$val" == "y" ]]
then
  echo "Uninstallning $1"
#avinstallera $1
fi
