#!/bin/sh

echo ; echo Rebooting hps11 ... ; roc_reboot hps11
echo ; echo Waiting 45 seconds after rebooting hps11 ... ; sleep 45
echo ; echo Rebooting hps12 ... ; roc_reboot hps12
echo ; echo Rebooting hps1 ...  ; roc_reboot hps1
echo ; echo Rebooting hps2 ...  ; roc_reboot hps2
echo ; echo Waiting 45 seconds before pinging ... ; sleep 45

while ! ping -q -a -c1 hps2  ; do sleep 5; done ; echo hps2 is Alive.
while ! ping -q -a -c1 hps1  ; do sleep 5; done ; echo hps1 is Alive.
while ! ping -q -a -c1 hps11 ; do sleep 5; done ; echo hps11 is Alive.
while ! ping -q -a -c1 hps12 ; do sleep 5; done ; echo hps12 is Alive.

echo
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo %%%%%%%%%%%%%%%%%%% ROCS REBOOTED %%%%%%%%%%%%%%%%%%%%%
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo
